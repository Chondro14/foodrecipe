import 'package:flutter/material.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';

class ReviewListTile extends StatelessWidget {
  String? review;
  ReviewListTile({required this.review});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        review ?? "",
        style: poppinsTitle2,
        overflow: TextOverflow.clip,
      ),
      subtitle: Text("Chondro",style: poppinsTitle3,),
    );
  }
}
