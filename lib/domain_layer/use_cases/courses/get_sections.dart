import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../entities/section_entity.dart';
import '../../repository/base_courses_repo.dart';

class GetSectionsUseCase {
  final BaseCoursesRepo _repository;

  GetSectionsUseCase(this._repository);

  Future<Either<Failure, List<SectionEntity>>> call() async =>
      await _repository.getSections();
}
