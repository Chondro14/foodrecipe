import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodsdelivery/Bloc/LoginCubit.dart';
import 'package:foodsdelivery/Bloc/ProductsCubit.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';
import 'package:foodsdelivery/View/AddProductRecipePageView/AddProductRecipePageView.dart';
import 'package:foodsdelivery/View/CategoryListPageView/CategoryListPageView.dart';
import 'package:foodsdelivery/View/DashboardPageView/Components/RecipeListTile.dart';
import 'package:foodsdelivery/View/SignInPageView/SignInPageView.dart';

class DashboardPageView extends StatefulWidget {
  const DashboardPageView({Key? key}) : super(key: key);

  @override
  State<DashboardPageView> createState() => _DashboardPageViewState();
}

class _DashboardPageViewState extends State<DashboardPageView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<ProductsCubit>().fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget logoutButton() {
      return BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
        if (state is LoginLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return IconButton(
            onPressed: () {
              context.read<LoginCubit>().logoutAccount();
            },
            icon: Icon(
              Icons.logout_rounded,
              color: redColor,
            ));
      }, listener: (context, state) {
        if (state is LogoutUserData) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: greenColor,
              content: Text(
                "Logout user data",
                style: poppinsTitle3.copyWith(color: Colors.white),
              )));
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => SigninPageView()),
              (route) => false);
        } else if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: redColor,
              content: Text(
                "Logout user data",
                style: poppinsTitle3.copyWith(color: Colors.white),
              )));
        }
      });
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddProductRecipePageView()));
          },
          child: Icon(
            Icons.add,
            size: 32,
            color: whiteColor,
          )),
      body:
          BlocConsumer<ProductsCubit, ProductsState>(builder: (context, state) {
        if (state is ProductsGetSuccess) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                actions: [
                  logoutButton(),
                  IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryListPageView()));}, icon: Icon(Icons.category))
                ],
                automaticallyImplyLeading: false,
                backgroundColor: primaryColor,
                expandedHeight: 160,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: Icon(
                    Icons.food_bank_rounded,
                    size: 64,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Recipe",
                    style: poppinsTitle2.copyWith(color: whiteColor),
                  ),
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, int index) {
                return RecipeListTile(
                  product: state.products[index],
                );
              }, childCount: state.products.length))
            ],
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      }, listener: (context, state) {
        if (state is ProductsFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: redColor,
              content: Text(
                state.error,
                style: poppinsTitle3.copyWith(color: Colors.white),
              )));
        }
      }),
    );
  }
}
