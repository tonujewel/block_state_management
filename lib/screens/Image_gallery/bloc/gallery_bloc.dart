import 'package:bloc/bloc.dart';
import 'package:bloc_state_management/models/gallery_hive_dm.dart';
import 'package:bloc_state_management/resources/api_provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:share_plus/share_plus.dart';
import '../../../services/image_gallery_service.dart';
part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final ApiProvider _apiProvider;

  final ImageService _imageService = ImageService();

  GalleryBloc(this._apiProvider) : super(GalleryLoadingState()) {
    on<LoadGalleryDataApiEvent>((event, emit) async {
      await _imageService.init();

      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        final result = _imageService.getImageList();
        if (result.isEmpty) {
          emit(GalleryNoInternetState());
        } else {
          final result = _imageService.getImageList();
          emit(GalleryLoadedState(result));
        }
      } else {
        emit(GalleryLoadingState());
        final response = await _apiProvider.getGalleryData();
        for (var i = 0; i < response.length; i++) {
          var data = GalleryHiveDm(
              raw: "${response[i].urls!.raw}",
              full: "${response[i].urls!.full}",
              regular: "${response[i].urls!.regular}",
              small: "${response[i].urls!.small}",
              thumb: "${response[i].urls!.thumb}",
              smallS3: "${response[i].urls!.smallS3}",
              id: "${response[i].id}",
              isSaved: false);

          if (!isExist(data)) {
            _imageService.addImageToList(data);
          }
        }
        final result = _imageService.getImageList();
        emit(GalleryLoadedState(result));
      }
    });

    on<GalleryNoInternetEvent>((event, emit) {
      emit(GalleryNoInternetState());
    });

    on<ShareImageEvent>((event, emit) {
      Share.share(event.url);
    });

    on<DownloadToGalleryEvent>((event, emit) async {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        emit(ImageSavedNoInternetState());
        final result = _imageService.getImageList();
        emit(GalleryLoadedState(result));
      } else {
        var imageId =
            await ImageDownloader.downloadImage(event.galleryHiveDm.small);
        if (imageId == null) {
          return;
        }

        GalleryHiveDm data = GalleryHiveDm(
          raw: event.galleryHiveDm.raw,
          full: event.galleryHiveDm.full,
          regular: event.galleryHiveDm.regular,
          small: event.galleryHiveDm.small,
          thumb: event.galleryHiveDm.thumb,
          smallS3: event.galleryHiveDm.smallS3,
          id: event.galleryHiveDm.id,
          isSaved: true,
        );
        _imageService.updateGallery(data);
        emit(ImageSavedState());
        final result = _imageService.getImageList();
        emit(GalleryLoadedState(result));
      }
    });
  }

  bool isExist(GalleryHiveDm data) {
    final result = _imageService.getImageList();
    return result.length >= 0
        ? result.any((GalleryHiveDm item) => item.id == data.id)
        : false;
  }
}
