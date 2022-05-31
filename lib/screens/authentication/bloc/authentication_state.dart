part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {


  const AuthenticationState();
}

class AuthenticationInitial extends AuthenticationState {
    final String? error;
  const AuthenticationInitial({this.error});

  @override
  List<Object?> get props => [];
}

class SuccessfullLoginState extends AuthenticationState {
  final String username;
  const SuccessfullLoginState(this.username);
  @override
  List<Object?> get props => [username];
}

class RegisteringServicesState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
