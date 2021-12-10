import 'package:flutter/material.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';
import 'package:foodsdelivery/View/DashboardPageView/DashboardPageView.dart';
import 'package:foodsdelivery/View/SignInPageView/SignInPageView.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenPageView extends StatefulWidget {
  const SplashScreenPageView({Key? key}) : super(key: key);

  @override
  State<SplashScreenPageView> createState() => _SplashScreenPageViewState();
}

class _SplashScreenPageViewState extends State<SplashScreenPageView> {

  Future<String> checkUser()async{
    final prefs = await SharedPreferences.getInstance();
    String user_id = prefs.getString("user_id") ?? "";
    return user_id;
  }
  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration(seconds: 4)).then((value){
      checkUser().then((value) {
        if(value == ''){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>SigninPageView()));
        }
        else{
          Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPageView()));
        }
      });

    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        color: primaryColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset("assets/87618-restaurant-order.json",fit: BoxFit.cover),
              CircularProgressIndicator(color: Colors.white,)
            ],
          ),
        ),
      ),
    );
  }
}
