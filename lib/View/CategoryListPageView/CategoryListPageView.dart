import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodsdelivery/Bloc/CategoryCubit.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';
import 'package:foodsdelivery/View/CategoryListPageView/Components/CategoryListTile.dart';
import 'package:foodsdelivery/View/DetailCategoryListPageView/DetailCategoryListPageView.dart';
import 'package:lottie/lottie.dart';

class CategoryListPageView extends StatefulWidget {
  const CategoryListPageView({Key? key}) : super(key: key);

  @override
  State<CategoryListPageView> createState() => _CategoryListPageViewState();
}

class _CategoryListPageViewState extends State<CategoryListPageView> {

  @override
  void initState() {
    // TODO: implement initState
    context.read<CategoryCubit>().getDataCategoryList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Widget listCategory() {
      return BlocBuilder<CategoryCubit, CategoryState>(
          builder: (context, state) {
        if (state is CategoryGetSuccess) {
          if (state.categoryList == 0) {
            return SizedBox(
              child: Lottie.asset(
                  "assets/65251-product-hunt-lottie-animation.json"),
            );
          } else {
            return SizedBox(
              child: ListView(
                children: List.generate(
                    state.categoryList.length,
                    (index) => GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (contexxt)=> DetailCategoryListPageView(id: state.categoryList[index].categoryId ?? "")));},
                      child: CategoryListTile(
                          name: state.categoryList[index].categoryName ?? ""),
                    )),
              ),
            );
          }
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(backgroundColor: primaryColor,title: Text("Category"),centerTitle: true,),
      body: Container(
        child: listCategory()

      ),
    );
  }
}
