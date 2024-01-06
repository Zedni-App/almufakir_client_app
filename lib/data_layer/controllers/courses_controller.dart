import 'dart:convert';

import 'package:dio/dio.dart';

import '../dio_helper.dart';

class CoursesController {
  final DioHelper dio;

  CoursesController(this.dio);

  // Future getCombo() async {
  //   final value = await dio.getData(url: 'api/get_TC_data.php');
  //   final res = json.decode(value!.data);
  //   return res;
  // }

  Future getCourses({required int sectionID}) async {
    
    final res = await dio.postData(
      url: 'api/get_courses.php',
      data: FormData.fromMap({"section_id": sectionID}),
    );
  
    return json.decode(res!.data);
  }

  // Future getTeachers() async {
  //   final value = await dio.getData(url: 'api/get_TC_data.php');
  //   final res = json.decode(value!.data);
  //   return res['teachers'];
  // }

  Future getSections() async {
    final value = await dio.getData(url: 'admin/sections/get_sections.php');

    return json.decode(value!.data);
  }
}
