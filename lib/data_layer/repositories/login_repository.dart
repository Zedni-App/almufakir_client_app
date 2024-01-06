import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/errors/failure.dart';
import '../../core/errors/failure_formatter.dart';
import '../../domain_layer/entities/user_entity.dart';
import '../../domain_layer/repository/base_login_repo.dart';
import '../controllers/login_controller.dart';
import '../models/user_model.dart';
import '../shared_preferences.dart';

class LoginRepository extends BaseLoginRepo {
  final LoginController controller;

  LoginRepository(this.controller);

  @override
  Future<Either<Failure, String>> loginStudent({
    required String email,
    required String password,
  }) async {
    try {
      final response = await controller.login(email: email, password: password);
      final jsonRes = json.decode(response);
      final res = jsonRes["result"];
      if (res == "StudentFound") {
        AppSp.setString(key: SPVars.sessionToken, value: jsonRes['token']);
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
      return Left(formatFailure(e));
    }
  }

  @override
  Future<Either<Failure, String>> registerStudent(UserEntity user) async {
    final model = UserModel.fromEntity(user);
    try {
      final response = await controller.register(model);
      final jsonRes = json.decode(response);
      final res = jsonRes["result"];
      if (res == "Inserted") {
        AppSp.setString(key: SPVars.sessionToken, value: jsonRes['token']);

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
      return Left(formatFailure(e));
    }
  }
}
