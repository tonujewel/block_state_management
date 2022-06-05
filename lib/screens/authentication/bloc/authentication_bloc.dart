
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/services/authenticationService.dart';
import 'package:bloc_state_management/services/todo_service.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationService? _auth;
  final TodoService _todoService;

  AuthenticationBloc(this._auth, this._todoService)
      : super(RegisteringServicesState()) {
        
    on<LoginEvent>((event, emit) async {
      final user =
          await _auth!.authenticateUser(event.username, event.password);

      if (user != null) {
        emit(SuccessfullLoginState(user.toString()));
        emit(const AuthenticationInitial());
      }
    });

    on<RegisterAccountEvent>((event, emit) async {
      final result = await _auth!.createUser(event.username, event.password);

      switch (result) {
        case UserCredential.success:
          emit(SuccessfullLoginState(event.username));
          break;
        case UserCredential.failure:
          emit(const AuthenticationInitial(error: "Theres been an error"));
          break;
        case UserCredential.alreadyExist:
          emit(const AuthenticationInitial(error: "User aleady exist"));
          break;
      }
    });

    on<RegisterServiceEvents>((event, emit) async {
      await _auth!.init();
      await _todoService.init();
      emit(const AuthenticationInitial());
    });
  }
}
