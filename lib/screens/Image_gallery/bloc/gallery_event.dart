part of 'gallery_bloc.dart';

abstract class GalleryEvent extends Equatable {
  const GalleryEvent();
}

class LoadGalleryDataApiEvent extends GalleryEvent {
  @override
  List<Object> get props => [];
}

class GalleryNoInternetEvent extends GalleryEvent {
  @override
  List<Object> get props => [];
}


