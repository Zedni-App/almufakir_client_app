import 'package:equatable/equatable.dart';

import 'feedback_entity.dart';
import 'lecture_entity.dart';

class CourseDataEntity extends Equatable {
  final List<LectureEntity> lectures;
  final List<FeedbackEntity> feedbacks;
  final double rate;
  final bool opened;

  const CourseDataEntity({
    required this.lectures,
    required this.feedbacks,
    required this.rate,
    required this.opened,
  });

  @override
  List<Object> get props => [lectures, feedbacks, rate, opened];
}
