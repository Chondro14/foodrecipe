import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodsdelivery/Bloc/ProductsCubit.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';
import 'package:foodsdelivery/View/DashboardPageView/DashboardPageView.dart';
import 'package:foodsdelivery/View/DetailRecipePageView/Components/ReviewListTile.dart';

class DetailRecipePageView extends StatefulWidget {
  String id;
  DetailRecipePageView({required this.id});

  @override
  State<DetailRecipePageView> createState() => _DetailRecipePageViewState();
}

class _DetailRecipePageViewState extends State<DetailRecipePageView> {
  TextEditingController reviewController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductsCubit>().fetchDetailProduct(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget submitAddReview() {
      return BlocConsumer<ProductsCubit, ProductsState>(
          builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return TextButton(
            onPressed: () {
              context
                  .read<ProductsCubit>()
                  .addReviewProduct(reviewController.text, widget.id, "1");
              context.read<ProductsCubit>().fetchDetailProduct(widget.id);
            },
            child: Text("Submit"));
      }, listener: (context, state) {
        if (state is ProductAddReviewSuccess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Success")));
          Navigator.pop(context);
        } else if (state is ProductsFailed) {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("${state.error}"),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"))
                  ],
                );
              });
        }
      });
    }

    return Scaffold(
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterFloat,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Column(
                      children: [
                        Text(
                          "Add Review",
                          style: poppinsTitle2.copyWith(fontWeight: title2),
                        ),
                        TextField(
                          controller: reviewController,
                          decoration:
                              InputDecoration(hintText: "I think......"),
                        ),
                        submitAddReview()
                      ],
                    ),
                  );
                });
          },
          label: Text("Add Review"),
          backgroundColor: primaryColor,
        ),
        body: BlocConsumer<ProductsCubit, ProductsState>(
          builder: (context, state) {
            if (state is ProductDetailGetSuccess) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                        onPressed: () {
                          context.read<ProductsCubit>().fetchProducts();
                          Navigator.pop(context);
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPageView()));
                        },
                        icon: Icon(
                          Icons.chevron_left_rounded,
                          color: whiteColor,
                        )),
                    actions: [
                      TextButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8))),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Update Data Product",
                                          style: poppinsTitle2,
                                        ),
                                        SizedBox(
                                          height: 12,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              hintText: "Name Product"),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              hintText: "Price Product"),
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              hintText: "Creator Product"),
                                        ),
                                        SizedBox(
                                          height: 24,
                                        ),
                                        SizedBox(
                                          width: size.width,
                                          child: TextButton(
                                              style: TextButton.styleFrom(
                                                  backgroundColor: greenColor,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12))),
                                              onPressed: () {},
                                              child: Text(
                                                "Update",
                                                style: poppinsTitle3.copyWith(
                                                    color: whiteColor),
                                              )),
                                        )
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            "Edit",
                            style: poppinsTitle3.copyWith(color: whiteColor,fontWeight: FontWeight.w900),
                          ))
                    ],
                    backgroundColor: primaryColor,
                    expandedHeight: size.height * 0.475,
                    title: Text("${state.productDetail[0].name}"),
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        margin: EdgeInsets.only(top: 48),
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                Container(
                                  width: size.width,
                                  height: size.height * 0.25,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "http://192.168.64.2/file_php/images/${state.productDetail[0].image ?? ""}"),
                                          fit: BoxFit.cover)),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(16)),
                                  width: size.width * 0.425,
                                  height: 40,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow[700],
                                        size: 18,
                                      ),
                                      Text(
                                        "4.8",
                                        style: poppinsTitle3.copyWith(
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.watch_later_outlined,
                                        color: greenColor,
                                        size: 18,
                                      ),
                                      Text(
                                        "15 mins",
                                        style: poppinsTitle3.copyWith(
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Icon(
                                        Icons.restaurant_outlined,
                                        color: redColor,
                                        size: 18,
                                      ),
                                      Text(
                                        "Easy",
                                        style: poppinsTitle3.copyWith(
                                            fontSize: 12),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 12),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.productDetail[0].name ?? "",
                                        style: poppinsTitle1.copyWith(
                                            color: Colors.white,
                                            fontWeight: title2),
                                      ),
                                      Text(
                                        "Rp ${state.productDetail[0].price ?? ""}",
                                        style: poppinsTitle3.copyWith(
                                            color: Colors.white,
                                            fontWeight: title2),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.view_headline_sharp,
                                        color: whiteColor,
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      child: Center(
                          child: Text(
                        "Review",
                        style: poppinsTitle1,
                      )),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                    return ReviewListTile(
                        review: state.productDetail[index].review);
                  }, childCount: state.productDetail.length))
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
          listener: (context, state) {},
        ));
  }
}
