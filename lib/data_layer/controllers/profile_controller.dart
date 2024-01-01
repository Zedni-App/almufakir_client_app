import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/app_user.dart';
import '../../core/utilities/service_locator.dart';
import '../dio_helper.dart';
import '../models/user_model.dart';

class ProfileController {
  final DioHelper dio;

  ProfileController(this.dio);

  Future<String> updateName({required UserModel user}) async {
    final value = await dio.postData(
      url: 'students/update_student_info.php',
      data: FormData.fromMap(
        user.toMap(),
      ),
    );
    return value!.data;
  }

  Future<String> updateData({required UserModel user}) async {
    final value = await dio.postData(
      url: 'students/update_student_info.php',
      data: FormData.fromMap(
        user.toMap(),
      ),
    );
    return value!.data;
  }

  Future<String> updatePhoto({
    required File image,
  }) async {
    final data = FormData.fromMap({
      "student_id": appUser.id,
      "cred": sl<DotEnv>().get("secret_key"),
      "image": await MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last),
    });
    final value =
        await dio.postData(url: 'students/update_student_img.php', data: data);

    return value!.data;
  }

  Future<String> updatePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    final value = await dio.postData(
        url: 'students/update_student_password.php',
        data: FormData.fromMap(
          {
            "id": appUser.id,
            "cred": sl<DotEnv>().get("secret_key"),
            "current_password": currentPassword,
            "new_password": newPassword,
          },
        ));

    return value!.data;
  }

  Future<String> getUserData({
    required String email,
    required String password,
  }) async {
    final value = await dio.postData(
      url: 'students/get_student_data.php',
      data: FormData.fromMap(
        {
          "email": email,
          "password": password,
        },
      ),
    );

    return value!.data;
  }
}
