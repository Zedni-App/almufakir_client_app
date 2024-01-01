import '../../domain_layer/entities/feedback_entity.dart';

class FeedbackModel extends FeedbackEntity {
  const FeedbackModel({
    required super.id,
    required super.date,
    required super.courseID,
    required super.commenterID,
    required super.rate,
    required super.feedback,
  });

  factory FeedbackModel.fromMap(Map<String, dynamic> map) {
    return FeedbackModel(
      id: map["id"],
      commenterID: map["student_id"],
      courseID: map["course_id"],
      feedback: map["comment"],
      rate: map["rate"],
      date: map["date"],
    );
  }
}
