import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:zidne/data_layer/controllers/login_controller.dart';
import 'package:zidne/data_layer/models/user_model.dart';
import 'package:zidne/domain_layer/entities/user_entity.dart';

import '../../core/errors/failure.dart';
import '../../domain_layer/repository/base_login_repo.dart';

class LoginRepository extends BaseLoginRepo {
  final LoginController controller;

  LoginRepository(this.controller);

  @override
  Future<Either<Failure, String>> loginStudent({
    required String email,
    required String password,
  }) async {
    try {
      final res = await controller.login(email: email, password: password);
      if (res == "StudentFound") {
        return const Right("أهلا بعودتك");
      }
      if (res == "StudentNotFound") {
        return const Left(
          DataBaseFailure(
            "اسم المستخدم أو كلمة المرور بهما خطأ..الرجاء التأكد منهما",
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
  Future<Either<Failure, String>> registerStudent(UserEntity user) async {
    final model = UserModel.fromEntity(user);
    try {
      final res = await controller.register(model);
      if (res == "Inserted") {
        return Right("أهلا بك ${user.fName}");
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
