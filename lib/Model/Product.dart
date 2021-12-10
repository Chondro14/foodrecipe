import 'package:foodsdelivery/Model/Review.dart';

class Product{
   String? id;
   String? name;
   String? price;
   String? image;
   String? creator;

  Product({required this.id,required this.name,required this.image,required this.price});

  Product.fromJson(Map<String,dynamic> json){
    id = json['idproduct'];
    name = json['nama'];
    price = json['harga'];
    image = json['image'];
    creator = json['pembuat'];
  }
  Map<String,dynamic> toJson(){
    return{
      'idproduct':id,
      'nama':name,
      'harga':price,
      'image':image,
      'pembuat':creator
    };
  }

}


class ProductDetail{
  String? id;
  String? name;
  String? price;
  String? creator;
  String? image;
  String? review;
  String? user_id;

  ProductDetail({required this.review,required this.id,required this.price,required this.image,required this.name,required this.creator});

  ProductDetail.fromJson(Map<String,dynamic> json){
    id = json['idproduct'];
    name = json['nama'];
    price = json['harga'];
    image = json['image'];
    creator = json['pembuat'];
    review = json['review'];
    user_id = json['user_id'];
  }

  Map<String,dynamic> toJson(){
    return{
      'idproduct':id,
      'nama':name,
      'harga':price,
      'image':image,
      'pembuat':creator,
      'review':review,
      'user_id':user_id
    };
  }

}
