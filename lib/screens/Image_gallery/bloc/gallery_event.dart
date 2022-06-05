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

class ShareImageEvent extends GalleryEvent {
  final String url;

  const ShareImageEvent(this.url);
  @override
  List<Object?> get props => [url];
}

class DownloadToGalleryEvent extends GalleryEvent {
  final GalleryHiveDm galleryHiveDm;

  const DownloadToGalleryEvent(this.galleryHiveDm);
  @override
  List<Object?> get props => [galleryHiveDm];
}
class GetLocalData extends GalleryEvent {

  @override
  List<Object?> get props => [];
}
