part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();
}

class LoginEvent extends AuthenticationEvent {
  final String username, password;

  const LoginEvent(this.username, this.password);
  @override
  List<Object?> get props => [username, password];
}

class RegisterServiceEvents extends AuthenticationEvent {
  @override
  List<Object?> get props => [];
}

class RegisterAccountEvent extends AuthenticationEvent {
  final String username, password;

 const RegisterAccountEvent(this.username, this.password);
  
  @override
  List<Object?> get props => [username,password];


}
