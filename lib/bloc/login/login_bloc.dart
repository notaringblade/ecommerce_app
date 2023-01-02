import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(( (event, emit) async {
      if(event is LoggingInEvent){
        if(event.userName.isEmpty || event.password.isEmpty){
          emit(LoggingIn());
          await Future<void>.delayed(const Duration(seconds: 2));
          emit(LogInFail());
          await Future<void>.delayed(const Duration(seconds: 2));
          emit(LoginInitial());
        }else {
          emit(LoggingIn());
          await Future<void>.delayed(const Duration(seconds: 2));
          emit(LoggedIn(username: event.userName, password: event.password));
        }
      }
      else if(event is LoggingOutEvent){
        emit(LoggingIn());
          await Future<void>.delayed(const Duration(seconds: 2));
        emit(LoginInitial());
      }
    }));
  }

  
}
