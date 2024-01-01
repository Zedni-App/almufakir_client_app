import '../../domain_layer/entities/teacher_entity.dart';

class TeacherModel extends TeacherEntity {
  const TeacherModel({
    required super.id,
    required super.name,
    required super.image,
    required super.number,
    required super.bio,
  });

  Map<String, dynamic> toMap() {
    return {
      'teacher_id': id,
      'name': name,
      'image': image,
      'number': number,
      'bio': bio,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      id: map['id'],
      name: map['name'],
      number: map['number'],
      image: map['image'] ?? '',
      bio: map['bio'] ?? '',
    );
  }

  factory TeacherModel.test() {
    return const TeacherModel(
      id: 0,
      name: "Name",
      number: "Number",
      image: "http",
      bio: "bio",
    );
  }

  factory TeacherModel.fromEntity(TeacherEntity teacher) {
    return TeacherModel(
      id: teacher.id,
      name: teacher.name,
      image: teacher.image,
      number: teacher.number,
      bio: teacher.bio,
    );
  }
}
