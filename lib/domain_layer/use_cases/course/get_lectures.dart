import 'package:dartz/dartz.dart';

import '../../../../core/failure_formatter.dart';
import '../../entities/lecture_entity.dart';
import '../../repository/base_course_repo.dart';

class GetLecturesUseCase {
  final BaseCourseRepo _repository;

  GetLecturesUseCase(this._repository);

  Future<Either<Failure, List<LectureEntity>>> call() async =>
      await _repository.getLectures();
}
