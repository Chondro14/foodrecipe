import 'package:flutter/material.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';

class CategoryListTile extends StatelessWidget {
  String name;
  CategoryListTile({required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(name,style: poppinsTitle3,),);
  }
}
