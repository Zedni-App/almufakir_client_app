import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../repository/base_profile_repo.dart';

class UpdateUserPasswordUseCase {
  final BaseProfileRepo _repository;

  UpdateUserPasswordUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String currentPassword,
    required String newPassword,
  }) async =>
      await _repository.updatePassword(
          currentPassword: currentPassword, newPassword: newPassword);
}
