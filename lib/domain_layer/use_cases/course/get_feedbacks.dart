import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../entities/feedback_entity.dart';
import '../../repository/base_course_repo.dart';

class GetFeedbacksUseCase {
  final BaseCourseRepo _repository;

  GetFeedbacksUseCase(this._repository);

  Future<Either<Failure, List<FeedbackEntity>>> call() async =>
      await _repository.getFeedbacks();
}
