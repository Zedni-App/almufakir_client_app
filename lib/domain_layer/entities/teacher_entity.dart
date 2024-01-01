import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'teacher_entity.g.dart';

@HiveType(typeId: 3)
class TeacherEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String image;
  @HiveField(3)
  final String number;
  @HiveField(4)
  final String bio;

  const TeacherEntity({
    this.id = 0,
    required this.name,
    required this.number,
    required this.image,
    required this.bio,
  });

  @override
  List<Object> get props => [id, name, number, image, bio];
}
