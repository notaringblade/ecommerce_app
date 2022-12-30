part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {

}

class LoggingIn extends LoginState{
  
}

class LoggedIn extends LoginState{
  final String username;
  final String password;

  const LoggedIn({required this.username, required this.password});
}

class LogInFail extends LoginState{
  
}

class Error extends LoginState{
  
}
