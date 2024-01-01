import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../entities/user_entity.dart';
import '../../repository/base_login_repo.dart';

class RegisterUserUseCase {
  final BaseLoginRepo _repository;

  RegisterUserUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required UserEntity user,
  }) async =>
      await _repository.registerStudent(user);
}
