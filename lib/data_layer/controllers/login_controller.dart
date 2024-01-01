import 'package:dio/dio.dart';

import '../dio_helper.dart';
import '../models/user_model.dart';

class LoginController {
  final DioHelper dio;

  LoginController(this.dio);

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final value = await dio.postData(
      url: 'students/student_login.php',
      data: FormData.fromMap(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    return value!.data;
  }

  Future<String> register(UserModel user) async {
    final value = await dio.postData(
      url: 'students/student_register.php',
      data: FormData.fromMap(user.toMap()),
    );

    return value!.data;
  }
}
