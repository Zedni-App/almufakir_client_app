import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';

abstract class BaseLoginRepo {
  Future<Either<Failure, String>> loginStudent({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> registerStudent({
    required String email,
    required String name,
    required String password,
  });

}