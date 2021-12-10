import 'dart:convert';

import 'package:foodsdelivery/Model/Category.dart';
import 'package:http/http.dart' as http;

class CategoryService{
  var url = "http://192.168.64.2";

  Future<List<Category>> getCategoryProduct()async{
    var uri = Uri.parse("$url/file_php/categorylist.php");
    var headers = {'Content-Type':'application/json'};

    var response = await http.get(uri,headers: headers);

    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      List<Category> categoryList = [];
      for(var item in data){
        categoryList.add(Category.fromJson(item));
      }
      return categoryList;
    }
    else{
      throw Exception("Error Get data");
    }
  }
  Future<List<CategoryProductList>> getProductCategoryList(String id)async{
    var uri = Uri.parse("$url/file_php/productlist_category.php");
    var headers = {'Content-Type':'application/json'};

    var response = await http.post(uri,body: {'id':id});

    if(response.statusCode == 200){
      List data = jsonDecode(response.body);
      List<CategoryProductList> categoryProduct = [];
      for(var item in data){
        categoryProduct.add(CategoryProductList.fromJson(item));
      }
      return categoryProduct;
    }else{
      throw Exception("Error Get data");
    }
  }
}