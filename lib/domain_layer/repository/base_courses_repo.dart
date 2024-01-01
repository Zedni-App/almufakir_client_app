import 'package:dartz/dartz.dart';
import '../entities/course_entity.dart';
import '../../core/failure_formatter.dart';

abstract class BaseCoursesRepo {
  Future<Either<Failure, String>> addCourse({
    required CourseEntity newCourse,
  });
  Future<Either<Failure, String>> editCourse({
    required CourseEntity newCourseData,
  });
  Future<Either<Failure, String>> deleteCourse({
    required int courseID,
  });
  Future<Either<Failure, List<CourseEntity>>> getCourses();
}
