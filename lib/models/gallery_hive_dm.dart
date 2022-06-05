import 'package:hive/hive.dart';
part 'gallery_hive_dm.g.dart';

@HiveType(typeId: 3)
class GalleryHiveDm extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String raw;
  @HiveField(2)
  final String full;
  @HiveField(3)
  final String regular;
  @HiveField(4)
  final String small;
  @HiveField(5)
  final String thumb;
  @HiveField(6)
  final String smallS3;
  @HiveField(7)
  final bool isSaved;

  GalleryHiveDm({required this.raw,required  this.full,required  this.regular,required  this.small,required  this.thumb,
     required  this.smallS3,required  this.id,required  this.isSaved});
}
