import 'package:flutter/material.dart';
import 'package:foodsdelivery/Model/Product.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';
import 'package:foodsdelivery/View/DetailRecipePageView/DetailRecipePageView.dart';

class RecipeListTile extends StatelessWidget {
  Product product;
  RecipeListTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => DetailRecipePageView(id:product.id ?? "",)));
      },
      title: Text(
        product.name ?? "",
        style: poppinsTitle2,
      ),
      subtitle: Text(
        product.price.toString(),
        overflow: TextOverflow.ellipsis,
      ),
      leading: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
            color: Colors.pink,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(image: NetworkImage("http://192.168.64.2/file_php/images/${product.image ?? ""}" ),fit: BoxFit.cover)),
      ),
    );
  }
}
