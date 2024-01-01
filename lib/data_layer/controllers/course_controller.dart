import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../core/app_user.dart';
import '../../core/utilities/service_locator.dart';
import '../dio_helper.dart';

class CourseController {
  final DioHelper dio;

  CourseController(this.dio);

  Future getCourseData(final int courseID) async {
    final value = await dio.postData(
      url: 'api/get_lecture_data.php',
      data: FormData.fromMap({
        "id": appUser.id,
        "cred": sl<DotEnv>().get("secret_key"),
        "course_id": courseID,
      }),
    );
    final res = json.decode(value!.data);
    return res;
  }
}
