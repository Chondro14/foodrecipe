import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodsdelivery/Model/User.dart';
import 'package:foodsdelivery/Service/LoginService.dart';
part 'LoginState.dart';

class LoginCubit extends Cubit<LoginState>{
  LoginCubit( ) : super(LoginInitial());

  void loginAccount(String userId,String password)async{
    try{
      emit(LoginLoading());
      User state = await LoginService().login(userId, password);
      emit(LoginSuccess(state));

    }catch(e){
      print(e);
      emit(LoginFailed("Error login,please check your userid and password"));
    }
  }

  void logoutAccount()async{
    try{
      emit(LoginLoading());
      void state = await LoginService().logout();
      emit(LogoutUserData("Logout Success"));
    }catch(e){
      emit(LoginFailed("Logout Failed"));
    }
  }

}