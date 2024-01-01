// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeacherEntityAdapter extends TypeAdapter<TeacherEntity> {
  @override
  final int typeId = 3;

  @override
  TeacherEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeacherEntity(
      id: fields[0] as int,
      name: fields[1] as String,
      number: fields[3] as String,
      image: fields[2] as String,
      bio: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TeacherEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.image)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.bio);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeacherEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
