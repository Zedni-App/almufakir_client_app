import 'dart:io';

import 'package:dio/dio.dart';
import 'package:zidne/data_layer/models/user_model.dart';

import '../dio_helper.dart';

class ProfileController {
  final DioHelper dio;

  ProfileController(this.dio);

  Future<String> updateData({
    required UserModel user
  }) async {
    final value = await dio.postData(
      url: 'update_student_info.php',
      data: FormData.fromMap(
        user.toMap(),
      ),
    );
    return value!.data;
  }

  Future<String> updatePhoto({
    required File image,
  }) async {
    final value = await dio.putData(
      url: 'student_register.php',
      data: {
        "image": await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last),
      },
    );

    return value!.data;
  }

  Future<String> getData({
    required String email,
  }) async {
    final value = await dio.putData(
      url: 'student_register.php',
      data: {
        "email":email,
      },
    );

    return value!.data;
  }
}
