import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../../repository/base_profile_repo.dart';

class GetUserUseCase {
  final BaseProfileRepo _repository;

  GetUserUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required String email,
    required String password,
  }) async =>
      await _repository.getData(email: email, password: password);
}
