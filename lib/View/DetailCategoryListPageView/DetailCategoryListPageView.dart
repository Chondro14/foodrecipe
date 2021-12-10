import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodsdelivery/Bloc/CategoryCubit.dart';

import 'package:foodsdelivery/Shared/SharedStyle.dart';

class DetailCategoryListPageView extends StatefulWidget {
  final String id;
  const DetailCategoryListPageView({required this.id});

  @override
  State<DetailCategoryListPageView> createState() =>
      _DetailCategoryListPageViewState();
}

class _DetailCategoryListPageViewState
    extends State<DetailCategoryListPageView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoryCubit>().getCategoryProductList(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget viewDetail() {
      return BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
        if (state is CategoryGetProduct) {
          return Container(
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
                                  "http://192.168.64.2/file_php/images/${state.categoryList[0].image ?? ""}"),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(16)),
                      width: size.width * 0.425,
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                            style: poppinsTitle3.copyWith(fontSize: 12),
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
                            style: poppinsTitle3.copyWith(fontSize: 12),
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
                            style: poppinsTitle3.copyWith(fontSize: 12),
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
                  padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
                  color: primaryColor,
                  height: size.height * 0.125,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(state.categoryList[0].name ?? "",style: poppinsTitle2.copyWith(color: whiteColor),),
                      Text(state.categoryList[0].categoryName ?? "",style: poppinsTitle3.copyWith(color: whiteColor),)
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              context.read<CategoryCubit>().getDataCategoryList();
              Navigator.pop(context);
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPageView()));
            },
            icon: Icon(
              Icons.chevron_left_rounded,
              color: whiteColor,
            )),
      ),
      body: viewDetail(),
    );
  }
}
