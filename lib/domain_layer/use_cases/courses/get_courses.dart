import 'package:dartz/dartz.dart';


import '../../../core/errors/failure.dart';
import '../../entities/course_entity.dart';
import '../../repository/base_courses_repo.dart';

class GetCoursesUseCase {
  final BaseCoursesRepo _repository;

  GetCoursesUseCase(this._repository);

  Future<Either<Failure, List<CourseEntity>>> call({required int sectionID}) async =>
      await _repository.getCourses(sectionID: sectionID);
}
