import 'dart:convert';

import 'package:foodsdelivery/Model/Product.dart';
import 'package:foodsdelivery/Model/Review.dart';
import 'package:http/http.dart' as http;

class ProductService{
  var url = "http://192.168.64.2";

  Future<List<Product>> getProducts()async{
    var uri = Uri.parse("$url/file_php/productlist.php");
    print(uri);
    var headers = {'Content-Type':'application/json'};
    
    var response = await http.get(uri,headers: headers);

    print(response);
    if (response.statusCode == 200){

      List data = jsonDecode(response.body);
      List<Product> products = [];
      for(var item in data){
        products.add(Product.fromJson(item));
      }
      return products;
    }else{
      throw Exception("Error Get data");
    }
  }
   Future<List<ProductDetail>> getDetailProduct(String id)async{
    var uri = Uri.parse("$url/file_php/detail_product.php");
    var headers = {'Content-Type':'application/json'};
    var response = await http.post(uri,body: {'id':id});
    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      List<ProductDetail> productDetail = [];
      for(var item in data){
        productDetail.add(ProductDetail.fromJson(item));
      }

      return productDetail;
    }else{
      throw Exception("Error get detail data");
    }
   }
   Future<String> addProduct(String name,String price,String creator,String category,String userid)async{
    var uri = Uri.parse("$url/file_php/inpitproduct.php");
    var response = await http.post(uri,body: {
      'nama':name,
      'harga':price,
      'pembuat':creator,
      'category':category,
      'user_id':userid
    });

    if(response.statusCode == 200){
      String data = jsonDecode(response.body);
      return data;
    }
    else{
      return "Error Add Product";
    }
   }

   // Future<String> updateProduct(String name,String price,String creator,String){
   //
   // }

   Future<String> addImageProduct(String image,String idproduct)async{
    var uri = Uri.parse("$url/file_php/inputpic.php");
    var response = await http.post(uri,body: {
      'image':image,
      'idproduct':idproduct
    });

    if(response.statusCode == 200){
      String data = jsonDecode(response.body);
      return data;
    }else{
      return "Error add Image";
    }
   }



   Future<String> addReview(String review,String idProduct,String userId)async{
     var uri = Uri.parse("$url/file_php/review.php");
     var response = await http.post(uri,body: {
       'idproduct':idProduct,
       'user_id':userId,
       'review':review
     });

     if(response.statusCode == 200){
       String data = jsonDecode(response.body);
       return data;
     }else{
       return "Error add Review";
     }
   }
}