part of'LoginCubit.dart';

abstract class LoginState extends Equatable{
  const LoginState();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class LoginSuccess extends LoginState{
  final User state;
  LoginSuccess(this.state);

  @override
  // TODO: implement props
  List<Object?> get props => [state];
}

class LoginUserGetData extends LoginState{
  final String userId;
  LoginUserGetData(this.userId);
  @override
  // TODO: implement props
  List<Object?> get props => [userId];


}
class LogoutUserData extends LoginState{
  final String state;
  LogoutUserData(this.state);
  @override
  // TODO: implement props
  List<Object?> get props => [state];
}

class LoginFailed extends LoginState{
  final String state;
  LoginFailed(this.state);
  @override
  // TODO: implement props
  List<Object?> get props => [state];
}