part of 'post_request_bloc.dart';

abstract class PostRequestEvent extends Equatable {
  const PostRequestEvent();

  @override
  List<Object> get props => [];
}

class PostRequestLoginApiCallEvent extends PostRequestEvent {
  final String email, password;

  const PostRequestLoginApiCallEvent(this.email, this.password);
  @override
  List<Object> get props => [email,password];
}

class GalleryNoInternetEvent extends PostRequestEvent {
  @override
  List<Object> get props => [];
}
