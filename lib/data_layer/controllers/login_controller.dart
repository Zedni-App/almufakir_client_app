import 'package:dio/dio.dart';

import '../dio_helper.dart';

class LoginController {
  final DioHelper dio;

  LoginController(this.dio);

  Future<String> login({
    required String email,
    required String password,
  }) async {
    final value = await dio.postData(
      url: 'student_login.php',
      data: FormData.fromMap(
        {
          'email': email,
          'password': password,
        },
      ),
    );
    return value!.data;
  }

  Future<String> register({
    required String email,
    required String name,
    required String password,
  }) async {
    final value = await dio.postData(
      url: 'student_register.php',
      data: FormData.fromMap(
        {
          'email': email,
          'name': name,
          'password': password,
        },
      ),
    );

    return value!.data;
  }
}
