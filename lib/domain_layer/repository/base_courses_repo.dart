import 'package:dartz/dartz.dart';

import '../../core/failure_formatter.dart';
import '../entities/combo_entity.dart';
import '../entities/course_entity.dart';
import '../entities/section_entity.dart';
import '../entities/teacher_entity.dart';

abstract class BaseCoursesRepo {
  Future<Either<Failure, List<CourseEntity>>> getCourses();
  Future<Either<Failure, List<TeacherEntity>>> getTeachers();
  Future<Either<Failure, List<SectionEntity>>> getSections();
  Future<Either<Failure, ComboEntity>> getCombo();
}
