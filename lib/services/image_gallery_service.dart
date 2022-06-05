import 'package:hive/hive.dart';

import '../models/gallery_hive_dm.dart';

class ImageService {
  late Box<GalleryHiveDm> imageBox;
  Future<void> init() async {
    if (!Hive.isAdapterRegistered(3)) {
      Hive.registerAdapter(GalleryHiveDmAdapter());
    }

    imageBox = await Hive.openBox<GalleryHiveDm>("ImageGallery");
  }

  List<GalleryHiveDm> getImageList() {
    final imageList = imageBox.values;
    return imageList.toList();
  }

  void addImageToList(GalleryHiveDm imageData) {
    imageBox.add(imageData);
  }

  Future<void> updateGallery(GalleryHiveDm imageData) async {


    final taskToUpdate =
        imageBox.values.firstWhere((element) => element.id == imageData.id);

    final index = taskToUpdate.key as int;
    await imageBox.put(index, imageData);
  }
}
