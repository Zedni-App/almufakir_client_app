import 'dart:io';

import 'package:dartz/dartz.dart';
import '../../../core/errors/failure.dart';
import '../../repository/base_profile_repo.dart';

class UpdateUserPhotoUseCase {
  final BaseProfileRepo _repository;

  UpdateUserPhotoUseCase(this._repository);

  Future<Either<Failure, String>> call({
    required File image,
  }) async =>
      await _repository.updatePhoto(image: image);
}
