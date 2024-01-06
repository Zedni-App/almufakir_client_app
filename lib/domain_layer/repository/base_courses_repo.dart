import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/course_entity.dart';
import '../entities/section_entity.dart';

abstract class BaseCoursesRepo {
  Future<Either<Failure, List<CourseEntity>>> getCourses({required int sectionID});
  // Future<Either<Failure, List<TeacherEntity>>> getTeachers();
  Future<Either<Failure, List<SectionEntity>>> getSections();
  // Future<Either<Failure, ComboEntity>> getCombo();
}
