part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoggingInEvent extends LoginEvent{
final String userName;
final String password;

  const LoggingInEvent(this.userName, this.password);
}

class LoggingOutEvent extends LoginEvent{
  
}
