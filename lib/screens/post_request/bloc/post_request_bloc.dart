import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/models/error_dm.dart';
import 'package:bloc_state_management/screens/post_request/sign_in_dm.dart';
import 'package:equatable/equatable.dart';

import '../../../resources/api_provider.dart';

part 'post_request_event.dart';
part 'post_request_state.dart';

class PostRequestBloc extends Bloc<PostRequestEvent, PostRequestState> {
  final ApiProvider _apiProvider;
  PostRequestBloc(this._apiProvider) : super(PostRequestInitial()) {
    on<PostRequestLoginApiCallEvent>((event, emit) async {
      emit(PostRequestLoadingState());
      final result = await _apiProvider.doSignIn(
          email: event.email, password: event.password);

      if (result != null) {
        print("object $result");
        if (result.toString().contains("false")) {
          print("object $result");
          ErrorDm errorDm = errorDmFromJson(result.toString());
          emit(PostRequestLoginFailedState("${errorDm.message}"));
        } else {
          SignInDm signInDm = signInDmFromJson(result.toString());
          print("object $result");
          emit(PostRequestLoginSuccessState(signInDm));
        }
      } else {
        emit(const PostRequestLoginFailedState("Something went wront"));
      }
    });
  }
}
