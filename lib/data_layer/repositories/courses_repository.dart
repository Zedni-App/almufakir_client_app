import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../core/failure_formatter.dart';
import '../../domain_layer/entities/course_entity.dart';
import '../../domain_layer/repository/base_courses_repo.dart';
import '../controllers/courses_controller.dart';
import '../models/course_model.dart';

class CoursesRepository extends BaseCoursesRepo {
  final CoursesController controller;

  CoursesRepository(this.controller);

  @override
  Future<Either<Failure, String>> addCourse(
      {required CourseEntity newCourse}) async {
    try {
      final res =
          await controller.addCourse(course: CourseModel.fromEntity(newCourse));
      if (res == "Course Added") {
        return const Right("تمت الإضافة");
      }
      if (res == "Error With Adding Course") {
        return const Left(
          DataBaseFailure("عذراً، حدث خطأ في إضافة البيانات"),
        );
      }
      if (kDebugMode) {
        print(res);
      }
      return const Left(DataBaseFailure("عذراً هناك خطأ غير متوقع"));
    } catch (e) {
      return Left(formatFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<CourseEntity>>> getCourses() async {
    try {
      final res = await controller.getCourses();
      final formatted = List.generate(
        res.length,
        (index) => CourseModel.fromMap(res[index]),
      );
      // saveBooksData(formatted, kCourseBox);
      return Right(formatted);
    } catch (e) {
      return Left(formatFailure(e));
    }
  }

  @override
  Future<Either<Failure, String>> deleteCourse({required int courseID}) async {
    try {
      final res = await controller.deleteCourse(courseID: courseID);
      if (res == "courseDeleted") {
        return const Right("تمت الإزالة");
      }
      if (res == "Error With Delete") {
        return const Left(
          DataBaseFailure("عذراً، حدث خطأ في الحذف"),
        );
      }
      if (res == "Error: course Not Found") {
        return const Left(
          DataBaseFailure("تمت إزالة الدورة بالفعل مسبقاً"),
        );
      }
      if (kDebugMode) {
        print(res);
      }
      return const Left(DataBaseFailure("عذراً هناك خطأ غير متوقع"));
    } catch (e) {
      return Left(formatFailure(e));
    }
  }

  @override
  Future<Either<Failure, String>> editCourse(
      {required CourseEntity newCourseData}) async {
    try {
      final res = await controller.editCourse(
          course: CourseModel.fromEntity(newCourseData));
      if (res == "CourseInfoUpdated") {
        return const Right("تم تحديث البيانات");
      }
      if (res == "ErrorWithUpdating") {
        return const Left(
          DataBaseFailure("عذراً، حدث خطأ في تحديث البيانات"),
        );
      }
      if (kDebugMode) {
        print(res);
      }
      return const Left(DataBaseFailure("عذراً هناك خطأ غير متوقع"));
    } catch (e) {
      return Left(formatFailure(e));
    }
  }
}
