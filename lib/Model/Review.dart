import 'package:foodsdelivery/Model/Product.dart';

class Review{
  String? user_id;
  Product? idProduct;
  String? review;

  Review({required this.user_id,required this.idProduct,required this.review});

  Review.fromJson(Map<String,dynamic> json){
    user_id = json["user_id"];
    idProduct = Product.fromJson(json['idproduct']);
    review = json["review"];
  }

  Map<String,dynamic> toJson(){
    return{
      'user_id':user_id,
      'idproduct':idProduct,
      'review':review
    };
  }

}