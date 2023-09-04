import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:zidne/data_layer/models/user_model.dart';
import 'package:zidne/domain_layer/entities/user_entity.dart';
import '../../core/errors/failure.dart';
import '../../domain_layer/repository/base_profile_repo.dart';
import '../controllers/profile_controller.dart';

class ProfileRepository extends BaseProfileRepo {
  final ProfileController controller;

  ProfileRepository(this.controller);

  @override
  Future<Either<Failure, String>> updateData({required UserEntity user}) async {
    try {
      final res = await controller.updateData(user: UserModel.fromEntity(user));
      if (res == "InfoUpdated") {
        return const Right("تم تحديث البيانات");
      }
      if (res == "ErrorWithUpdates") {
        return const Left(
          DataBaseFailure(
            "خطأ في تحديث البيانات",
          ),
        );
      }
      if (res == "ErrorWithUpdatesExecution") {
        return const Left(
          DataBaseFailure(
            "خطأ في تنفيذ طلب التحديث",
          ),
        );
      }
      if (kDebugMode) {
        print(res);
      }
      return const Left(ServerFailure("عذراً هناك خطأ غير متوقع"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> updatePhoto({required File image}) async {
    try {
      final res = await controller.updatePhoto(
        image: image,
      );
      if (res == "Inserted") {
        return const Right("أهلا بعودتك");
      }
      if (res == "Existed") {
        return const Left(
          DataBaseFailure(
            "هذا البريد مستخدم مسبقاً..الرجاء تسجيل الدخول أو التأكد منه",
          ),
        );
      }
      if (kDebugMode) {
        print(res);
      }
      return const Left(ServerFailure("عذراً هناك خطأ غير متوقع"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getData({required String email}) async {
    try {
      final res = await controller.getData(
        email: email,
      );
      if (res == "Inserted") {
        return const Right("أهلا بعودتك");
      }
      if (res == "Existed") {
        return const Left(
          DataBaseFailure(
            "هذا البريد مستخدم مسبقاً..الرجاء تسجيل الدخول أو التأكد منه",
          ),
        );
      }
      if (kDebugMode) {
        print(res);
      }
      return const Left(ServerFailure("عذراً هناك خطأ غير متوقع"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
