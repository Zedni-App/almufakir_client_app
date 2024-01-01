import 'package:dartz/dartz.dart';

import '../../../core/failure_formatter.dart';
import '../entities/course_entity.dart';
import '../repository/base_courses_repo.dart';

class GetCoursesUseCase {
  final BaseCoursesRepo _repository;

  GetCoursesUseCase(this._repository);

  Future<Either<Failure, List<CourseEntity>>> call() async =>
      await _repository.getCourses();
}
