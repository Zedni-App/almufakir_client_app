import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/section_entity.dart';

abstract class BaseCoursesRepo {
  // Future<Either<Failure, List<CourseEntity>>> getCourses();
  // Future<Either<Failure, List<TeacherEntity>>> getTeachers();
  Future<Either<Failure, List<SectionEntity>>> getSections();
  // Future<Either<Failure, ComboEntity>> getCombo();
}
