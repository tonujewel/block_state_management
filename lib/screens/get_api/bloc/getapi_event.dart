part of 'getapi_bloc.dart';

abstract class GetApiEvent extends Equatable {
  const GetApiEvent();
}

class LoadGetApiEvent extends GetApiEvent {
  @override
  List<Object> get props => [];
}
class GetApiNoInternetEvent extends GetApiEvent {
  @override
  List<Object> get props => [];
}
