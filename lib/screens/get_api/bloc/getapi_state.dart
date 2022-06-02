part of 'getapi_bloc.dart';

abstract class GetApiState extends Equatable {
  const GetApiState();
}

class GetapiLoadingState extends GetApiState {
  @override
  List<Object> get props => [];
}

class GetapiLoadedState extends GetApiState {
  final CovidDm covidDm;

  const GetapiLoadedState(this.covidDm);
  @override
  List<Object> get props => [covidDm];
}

class GetApiNoInternetState extends GetApiState {
  @override
  List<Object?> get props => [];
}
