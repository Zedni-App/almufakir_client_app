import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:zidne/data_layer/dio_helper.dart';
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
      final decoded = json.decode(res);
      if (decoded["status"] == "Image Updated") {
        return Right("${DioHelper.baseURL}${decoded["image"]}");
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
  Future<Either<Failure, String>> updatePassword(
      {required String currentPassword, required String newPassword}) async {
    try {
      final res = await controller.updatePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
      if (res == "Password changed") {
        return const Right("تم تحديث كلمة المرور بنجاح");
      }
      if (kDebugMode) {
        print(res);
      } //Wrong ID or current password
      return const Left(ServerFailure("عذراً هناك خطأ غير متوقع"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> getData(
      {required String email, required String password}) async {
    try {
      final res = await controller.getUserData(
        email: email,
        password: password,
      );
      if (res == "Wrong email or password" || res == "ErrorWithExecution") {
        return const Left(
          DataBaseFailure(
            "حدث خطأ في جلب بياناتك،يمكنك إغادة تسجيل الدخول",
          ),
        );
      }
      final done = _saveData(json.decode(res));
      if (done) {
        return const Right("تم");
      }
      if (kDebugMode) {
        print(res);
      }
      return const Left(ServerFailure("عذراً هناك خطأ غير متوقع"));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  bool _saveData(decode) {
    if (decode["student"] != null && decode["student"].isNotEmpty) {
      final user = UserModel.fromMap(decode["student"][0]);
      user.saveUser();
      return true;
    }
    return false;
  }
}
