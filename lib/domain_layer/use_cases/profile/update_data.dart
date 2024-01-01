import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../entities/user_entity.dart';
import '../../repository/base_profile_repo.dart';

class UpdateUserDataUseCase {
  final BaseProfileRepo _repository;

  UpdateUserDataUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required UserEntity user,
  }) async =>
      await _repository.updateData(user: user);
}
