// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/models/covid_dm.dart';
import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:equatable/equatable.dart';

part 'getapi_event.dart';
part 'getapi_state.dart';

class GetApiBloc extends Bloc<GetApiEvent, GetApiState> {
  final ApiProvider _apiProvider;

  GetApiBloc( this._apiProvider)
      : super(GetapiLoadingState()) {
  

    on<GetApiEvent>((event, emit) async {
      emit(GetapiLoadingState());
      final response = await _apiProvider.getCovidData();
      emit(GetapiLoadedState(response));
    });

    on<GetApiNoInternetEvent>((event,emit) async{
      emit(GetApiNoInternetState());
    });
  }
}
