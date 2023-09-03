import 'package:dartz/dartz.dart';
import '../../repository/base_login_repo.dart';

import '../../../core/errors/failure.dart';

class RegisterUserUseCase {
  final BaseLoginRepo _repository;

  RegisterUserUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String email,
    required String name,
    required String password,
  }) async =>
      await _repository.registerStudent(
        email: email,
        name: name,
        password: password,
      );
}
