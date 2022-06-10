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
  @override
  List<Object> get props => [];
}

class PostRequestLoginFailedState extends PostRequestState {
  @override
  List<Object> get props => [];
}
