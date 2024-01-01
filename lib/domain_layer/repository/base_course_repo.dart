import 'package:dartz/dartz.dart';

import '../../core/failure_formatter.dart';
import '../entities/course_data_entity.dart';
import '../entities/feedback_entity.dart';
import '../entities/lecture_entity.dart';

abstract class BaseCourseRepo {
  Future<Either<Failure, List<LectureEntity>>> getLectures();
  Future<Either<Failure, List<FeedbackEntity>>> getFeedbacks();
  Future<Either<Failure, CourseDataEntity>> getCourseData(int courseID);
}
