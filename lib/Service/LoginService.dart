import 'dart:convert';

import 'package:foodsdelivery/Model/User.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginService{
  String url = "http://192.168.64.2";


  Future<User> login(String userId,String password)async{
    try{
      var uri = Uri.parse("$url/file_php/login.php");
      final response = await http.post(uri,body: {'user_id':userId,'user_password':password});
      print(response.statusCode);
      final prefs = await SharedPreferences.getInstance();

      if (response.statusCode == 200){
        Map json = jsonDecode(response.body);
        print(json['result']);
        if(json['result'] == 'success'){

          prefs.setString("user_id", userId);
          prefs.setString("user_name", json["user_name"]);
          User user = User(userId: userId, password: password,userName: json["user_name"]);
          return user;

        }else{
          throw Exception("Error");
        }
      }else{
        throw Exception("Error");
      }

    }
    catch(e){
      throw e;
    }


  }



  Future<void> logout()async{
    var a = await SharedPreferences.getInstance();
    a.remove("user_id");
    a.remove("user_name");

  }
}