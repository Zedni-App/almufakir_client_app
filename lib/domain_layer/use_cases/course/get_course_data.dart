import 'package:dartz/dartz.dart';

import '../../../../core/failure_formatter.dart';
import '../../entities/course_data_entity.dart';
import '../../repository/base_course_repo.dart';

class GetCourseDataUseCase {
  final BaseCourseRepo _repository;

  GetCourseDataUseCase(this._repository);

  Future<Either<Failure, CourseDataEntity>> call(
          {required int courseID}) async =>
      await _repository.getCourseData(courseID);
}
