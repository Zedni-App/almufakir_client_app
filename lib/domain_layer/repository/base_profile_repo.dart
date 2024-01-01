import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../core/errors/failure.dart';
import '../entities/user_entity.dart';

abstract class BaseProfileRepo {
  Future<Either<Failure, String>> updateData({
    required UserEntity user,
  });
  Future<Either<Failure, String>> getData({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> updatePassword({
    required String currentPassword,
    required String newPassword,
  });

  Future<Either<Failure, String>> updatePhoto({
    required File image,
  });
}
