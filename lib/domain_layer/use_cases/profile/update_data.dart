import 'package:dartz/dartz.dart';
import 'package:zidne/domain_layer/entities/user_entity.dart';
import '../../../core/errors/failure.dart';
import '../../repository/base_profile_repo.dart';

class UpdateUserDataUseCase {
  final BaseProfileRepo _repository;

  UpdateUserDataUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required UserEntity user,

  }) async =>
      await _repository.updateData(
        user: user
      );
}
