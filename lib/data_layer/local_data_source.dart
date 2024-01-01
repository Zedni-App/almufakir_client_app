import 'package:hive_flutter/hive_flutter.dart';
import '../domain_layer/entities/course_entity.dart';
import '../domain_layer/entities/lecture_entity.dart';
import '../domain_layer/entities/section_entity.dart';
import '../domain_layer/entities/teacher_entity.dart';
import 'hive_helper.dart';

import '../domain_layer/entities/comment_entity.dart';

class LocalDatabase {
  List<CommentEntity> getComments() =>
      Hive.box<CommentEntity>(kCommentBox).values.toList();

  List<CourseEntity> getCourses() {
    return Hive.box<CourseEntity>(kCourseBox).values.toList();
  }

  List<LectureEntity> getLectures(int courseID) =>
      Hive.box<LectureEntity>(kLectureBox)
          .values
          .where((element) => element.courseID == courseID)
          .toList();

  List<SectionEntity> getSections() =>
      Hive.box<SectionEntity>(kSectionBox).values.toList();

  List<TeacherEntity> getTeachers() =>
      Hive.box<TeacherEntity>(kTeacherBox).values.toList();
}
