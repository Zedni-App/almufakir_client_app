import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class BaseLoginRepo {
  Future<Either<Failure, String>> loginStudent({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> registerStudent(UserEntity user);
  
}
