import 'package:hive_flutter/hive_flutter.dart';

import '../domain_layer/entities/course_entity.dart';
import '../domain_layer/entities/lecture_entity.dart';
import '../domain_layer/entities/section_entity.dart';
import '../domain_layer/entities/teacher_entity.dart';

const kCourseBox = "course box";
const kLectureBox = "lecture box";
const kSectionBox = "section box";
const kTeacherBox = "teacher box";

class HiveHelper {
  static Future init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CourseEntityAdapter());
    Hive.registerAdapter(LectureEntityAdapter());
    Hive.registerAdapter(SectionEntityAdapter());
    Hive.registerAdapter(TeacherEntityAdapter());
    await Hive.openBox(kCourseBox);
    await Hive.openBox(kLectureBox);
    await Hive.openBox(kSectionBox);
    await Hive.openBox(kTeacherBox);
  }

  static Future saveBooksData(dynamic data, String boxName) async {
    await Hive.openBox<dynamic>(boxName).then((box) => box.addAll(data));
  }

  static removeBookData(dynamic data, String boxName) async {
    await Hive.openBox(boxName).then((box) => box.delete(data));
  }

  static Future<void> clear() async {
    await Hive.deleteFromDisk();
  }
}
