part of 'gallery_bloc.dart';

abstract class GalleryState extends Equatable {
  const GalleryState();
}

class GalleryLoadingState extends GalleryState {
  @override
  List<Object> get props => [];
}

class GalleryLoadedState extends GalleryState {
  final List<GalleryHiveDm> imageGalleryList;

  const GalleryLoadedState(this.imageGalleryList);
  @override
  List<Object?> get props => [];
}

class GalleryNoInternetState extends GalleryState {
  @override
  List<Object?> get props => [];
}
class ImageSavedState extends GalleryState {
  @override
  List<Object?> get props => [];
}
class ImageSavedNoInternetState extends GalleryState {
  @override
  List<Object?> get props => [];
}



