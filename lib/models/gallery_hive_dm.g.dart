// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gallery_hive_dm.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GalleryHiveDmAdapter extends TypeAdapter<GalleryHiveDm> {
  @override
  final int typeId = 3;

  @override
  GalleryHiveDm read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GalleryHiveDm(
      raw: fields[1] as String,
      full: fields[2] as String,
      regular: fields[3] as String,
      small: fields[4] as String,
      thumb: fields[5] as String,
      smallS3: fields[6] as String,
      id: fields[0] as String,
      isSaved: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GalleryHiveDm obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.raw)
      ..writeByte(2)
      ..write(obj.full)
      ..writeByte(3)
      ..write(obj.regular)
      ..writeByte(4)
      ..write(obj.small)
      ..writeByte(5)
      ..write(obj.thumb)
      ..writeByte(6)
      ..write(obj.smallS3)
      ..writeByte(7)
      ..write(obj.isSaved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GalleryHiveDmAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
