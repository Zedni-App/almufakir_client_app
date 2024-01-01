// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lecture_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LectureEntityAdapter extends TypeAdapter<LectureEntity> {
  @override
  final int typeId = 1;

  @override
  LectureEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
  
    return LectureEntity(
      id: fields[0] as int,
      courseID: fields[1] as int,
      title: fields[2] as String,
      description: fields[3] as String,
      thumbnail: fields[4] as String,
      video: fields[6] as String,
      duration: fields[7] as String,
      videoFromLocal: fields[8] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LectureEntity obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.courseID)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.thumbnail)
      ..writeByte(6)
      ..write(obj.video)
      ..writeByte(7)
      ..write(obj.duration)
      ..writeByte(8)
      ..write(obj.videoFromLocal);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LectureEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
