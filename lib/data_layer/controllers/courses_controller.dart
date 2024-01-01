import 'dart:convert';

import '../dio_helper.dart';

class CoursesController {
  final DioHelper dio;

  CoursesController(this.dio);

  Future getCombo() async {
    final value = await dio.getData(url: 'api/get_TC_data.php');
    final res = json.decode(value!.data);
    return res;
  }

  Future getCourses() async {
    final value = await dio.getData(url: 'api/get_TC_data.php');
    final res = json.decode(value!.data);
    return res['courses'];
  }

  Future getTeachers() async {
    final value = await dio.getData(url: 'api/get_TC_data.php');
    final res = json.decode(value!.data);
    return res['teachers'];
  }

  Future getSections() async {
    final value = await dio.getData(url: 'api/get_TC_data.php');
    final res = json.decode(value!.data);
    return res['sections'];
  }
}
