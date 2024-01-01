import '../../domain_layer/entities/course_entity.dart';

class CourseModel extends CourseEntity {
  const CourseModel({
    required super.id,
    required super.name,
    required super.description,
    required super.imageURL,
    required super.price,
    required super.teacherID,
    required super.sectionID,
    super.isImageFromLocal,
  });

  Map<String, dynamic> toMap() {
    return {
      'course_id': id,
      'name': name,
      'description': description,
      'image': imageURL,
      'teacher': teacherID,
      'price': price,
      'section_id': sectionID,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    print(map);
    return CourseModel(
      id: map['id'],
      name: map['name'],
      description: map['description'] ?? "",
      price: map['price'],
      imageURL: map['image'] ?? "",
      teacherID: map['teacher_id'],
      sectionID: map['section'] ?? 1,
    );
  }

  factory CourseModel.fromEntity(CourseEntity course) {
    return CourseModel(
      id: course.id,
      name: course.name,
      description: course.description,
      imageURL: course.imageURL,
      isImageFromLocal: course.isImageFromLocal,
      price: course.price,
      teacherID: course.teacherID,
      sectionID: course.sectionID,
    );
  }
}
