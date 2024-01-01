import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'course_entity.g.dart';

@HiveType(typeId: 0)
class CourseEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String imageURL;
  @HiveField(4)
  final bool isImageFromLocal;
  @HiveField(5)
  final String teacherName;
  @HiveField(6)
  final String sectionName;
  @HiveField(7)
  final String price;

  const CourseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageURL,
    required this.teacherName,
    required this.sectionName,
    this.isImageFromLocal = false,
  });

  @override
  List<Object> get props => [
        id,
        name,
        price,
        imageURL,
        description,
        teacherName,
        sectionName,
        isImageFromLocal,
      ];

  CourseEntity copyWith({
    int? id,
    String? name,
    String? description,
    String? imageURL,
    bool? isImageFromLocal,
    String? teacherName,
    String? sectionName,
    String? price,
  }) {
    return CourseEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      imageURL: imageURL ?? this.imageURL,
      isImageFromLocal: isImageFromLocal ?? this.isImageFromLocal,
      teacherName: teacherName ?? this.teacherName,
      sectionName: sectionName ?? this.sectionName,
      price: price ?? this.price,
    );
  }
}
