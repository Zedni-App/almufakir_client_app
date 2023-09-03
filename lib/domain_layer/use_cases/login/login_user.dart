import 'package:dartz/dartz.dart';
import '../../repository/base_login_repo.dart';

import '../../../core/errors/failure.dart';

class LoginUserUseCase {
  final BaseLoginRepo _repository;

  LoginUserUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String email,
    required String password,
  }) async =>
      await _repository.loginStudent(email: email,password: password);
}
