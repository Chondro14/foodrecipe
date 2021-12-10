import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodsdelivery/Bloc/ProductsCubit.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';

class AddProductRecipePageView extends StatelessWidget {
  const AddProductRecipePageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget addImageButton() {
      return TextButton(onPressed: () {}, child: Text("Upload Image"));
    }

    Widget submitAddProductButton() {
      return BlocConsumer<ProductsCubit, ProductsState>(
          builder: (context, state) {
        if (state is ProductsLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return TextButton(onPressed: () {}, child: Text("Add Product"));
      }, listener: (context, state) {
        if (state is ProductAddProduct) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Success Add Data Product")));
        } else if (state is ProductsFailed) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              state.error,
              style: poppinsTitle3.copyWith(color: whiteColor),
            ),
            backgroundColor: Colors.red,
          ));
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text("Add Products"),
        centerTitle: true,
        automaticallyImplyLeading: true,
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
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24,vertical: 32),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(hintText: "Name Product"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Price Product"),
            ),
            TextField(
              decoration: InputDecoration(hintText: "Creator Product"),
            ),
            submitAddProductButton()
          ],
        ),
      ),
    );
  }
}
