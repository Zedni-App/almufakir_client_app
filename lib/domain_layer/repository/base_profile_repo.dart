import 'dart:io';
import 'package:dartz/dartz.dart';
import '../entities/user_entity.dart';
import '../../core/errors/failure.dart';

abstract class BaseProfileRepo {
  Future<Either<Failure, String>> updateData({
    required UserEntity user,
  });
  Future<Either<Failure, String>> getData({
    required String email,
  });

  Future<Either<Failure, String>> updatePhoto({
    required File image,
  });
}
