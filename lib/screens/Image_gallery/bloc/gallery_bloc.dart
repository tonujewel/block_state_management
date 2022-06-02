import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:equatable/equatable.dart';

import '../../../models/gallery_dm.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final ApiProvider _apiProvider;

  GalleryBloc(this._apiProvider) : super(GalleryLoadingState()) {
    on<LoadGalleryDataApiEvent>((event, emit) async {
      emit(GalleryLoadingState());
      final response = await _apiProvider.getGalleryData();
      emit(GalleryLoadedState(response));
    });

    on<GalleryNoInternetEvent>((event, emit) {
      emit(GalleryNoInternetState());
    });

  }


}
