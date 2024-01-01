import '../../domain_layer/entities/course_data_entity.dart';

class CourseDataModel extends CourseDataEntity {
  const CourseDataModel({
    required super.lectures,
    required super.feedbacks,
    required super.rate,
    required super.opened,
  });

  factory CourseDataModel.fromMap(Map<String, dynamic> map) {
  
    return const CourseDataModel(
        feedbacks: [], lectures: [], opened: true, rate: 0);
  }
}
