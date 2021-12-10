import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodsdelivery/Bloc/LoginCubit.dart';
import 'package:foodsdelivery/Shared/SharedStyle.dart';
import 'package:foodsdelivery/View/DashboardPageView/DashboardPageView.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SigninPageView extends StatefulWidget {
  @override
  State<SigninPageView> createState() => _SigninPageViewState();
}

class _SigninPageViewState extends State<SigninPageView> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    Widget signInButton() {
      return BlocConsumer<LoginCubit, LoginState>(builder: (context, state) {
        if (state is LoginLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return SizedBox(
          width: size.width,

          child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              onPressed: () {
                if (idController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: redColor,
                      content: Text(
                        "Please Input ID and Password field",
                        style: poppinsTitle3.copyWith(color: whiteColor),
                      )));
                } else {
                  context
                      .read<LoginCubit>()
                      .loginAccount(idController.text, passwordController.text);

                }
              },
              child: Text(
                "Sign in",
                style: poppinsTitle2.copyWith(color: Colors.white),
              )),
        );
      }, listener: (context, state) async{

        if (state is LoginSuccess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DashboardPageView()));
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: greenColor,
              content: Text(
                "Success Login",
                style: poppinsTitle3.copyWith(color: whiteColor),

              )));




        }
        else if(state is LoginFailed){
          var prefs = await SharedPreferences.getInstance();
          if(prefs.getString("user_id") != null){
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DashboardPageView()));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: greenColor,
                content: Text(
                  "Success Login",
                  style: poppinsTitle3.copyWith(color: whiteColor),

                )));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: redColor,
                content: Text(
                  state.state,
                  style: poppinsTitle3.copyWith(color: whiteColor),
                )));
          }

        }
      });
    }

    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sign in",
                    style: poppinsTitle1.copyWith(fontWeight: title1),
                  ),
                  Text("Feel free for explore recipe's")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  TextField(
                    controller: idController,
                    decoration: InputDecoration(hintText: "Input your ID"),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration:
                        InputDecoration(hintText: "Input your password"),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  signInButton()
                ],
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
