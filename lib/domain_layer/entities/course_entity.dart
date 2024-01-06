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
  final String teacherName;
  @HiveField(5)
  final String price;

  const CourseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageURL,
    required this.teacherName,
  });

  @override
  List<Object> get props => [
        id,
        name,
        price,
        imageURL,
        description,
        teacherName,
        
      ];

 
}
