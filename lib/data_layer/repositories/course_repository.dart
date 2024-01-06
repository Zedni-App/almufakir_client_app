import 'package:dartz/dartz.dart';
import 'package:zidne/data_layer/hive_helper.dart';

import '../../core/errors/failure.dart';
import '../../core/errors/failure_formatter.dart';
import '../../domain_layer/repository/base_course_repo.dart';
import '../controllers/course_controller.dart';
import '../models/course_data_model.dart';
import '../models/feedback_model.dart';
import '../models/lecture_model.dart';

class CourseRepository extends BaseCourseRepo {
  final CourseController controller;

  CourseRepository(this.controller);

  @override
  Future<Either<Failure, CourseDataModel>> getCourseData(int courseID) async {
    try {
      final res = await controller.getCourseData(courseID);
      final formatted = CourseDataModel.fromMap(res);
      HiveHelper. saveBooksData(formatted.lectures, kLectureBox);
      return Right(formatted);
    } catch (e) {
      return Left(formatFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<FeedbackModel>>> getFeedbacks() {
    // TODO: implement getFeedbacks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<LectureModel>>> getLectures() {
    // TODO: implement getLectures
    throw UnimplementedError();
  }
}
