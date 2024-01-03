// import '../../domain_layer/entities/combo_entity.dart';
// import 'course_model.dart';
// import 'section_model.dart';
// import 'teacher_model.dart';

// class ComboModel extends ComboEntity {
//   const ComboModel({
//     required super.courses,
//     required super.teachers,
//     required super.sections,
//   });

//   factory ComboModel.fromMap(Map<String, dynamic> map) {
  
//     return ComboModel(
//       courses: List<CourseModel>.generate(
//         map['courses'].length,
//         (index) => CourseModel.fromMap(map['courses'][index]),
//       ),
//       sections: List<SectionModel>.generate(
//         map['sections'].length,
//         (index) => SectionModel.fromMap(
//           map['sections'][index],
//         ),
//       ),
//       teachers: List<TeacherModel>.generate(
//         map['teachers'].length,
//         (index) => TeacherModel.fromMap(
//           map['teachers'][index],
//         ),
//       ),
//     );
//   }
// }
