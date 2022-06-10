import 'package:bloc/bloc.dart';
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
        emit(PostRequestLoginSuccessState());
      } else {
        emit(PostRequestLoginFailedState());
      }
    });
  }
}
