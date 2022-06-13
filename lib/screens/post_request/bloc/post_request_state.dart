part of 'post_request_bloc.dart';

abstract class PostRequestState extends Equatable {
  const PostRequestState();

  @override
  List<Object> get props => [];
}

class PostRequestInitial extends PostRequestState {}

class PostRequestLoadingState extends PostRequestState {
  @override
  List<Object> get props => [];
}

class PostRequestLoginSuccessState extends PostRequestState {
  final SignInDm signInDm;

  const PostRequestLoginSuccessState(this.signInDm);
  @override
  List<Object> get props => [signInDm];
}

class PostRequestLoginFailedState extends PostRequestState {
  final String message;

  const PostRequestLoginFailedState(this.message);
  @override
  List<Object> get props => [message];
}
