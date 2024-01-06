import '../../domain_layer/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageURL,
    required super.price,
    required super.teacherName,
  });

  factory CourseModel.fromMap(Map<String, dynamic> map) {
  
    return CourseModel(
      id: map['id'],
      name: map['name'],
      description: map['description'] ?? "",
      price: map['price']??"",
      imageURL: map['image'] ?? "",
      teacherName: map['teacher_name']??"",
    );
  }
}
