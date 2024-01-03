import 'package:dartz/dartz.dart';

import '../../core/failure_formatter.dart';
import '../../domain_layer/repository/base_courses_repo.dart';
import '../controllers/courses_controller.dart';
import '../hive_helper.dart';
import '../models/section_model.dart';

class CoursesRepository extends BaseCoursesRepo {
  final CoursesController controller;

  CoursesRepository(this.controller);

  // @override
  // Future<Either<Failure, List<CourseModel>>> getCourses() async {
  //   try {
  //     final res = await controller.getCourses();
  //     final formatted = List.generate(
  //       res.length,
  //       (index) => CourseModel.fromMap(res[index]),
  //     );
  //     saveBooksData(formatted, kCourseBox);
  //     return Right(formatted);
  //   } catch (e) {
  //     return Left(formatFailure(e));
  //   }
  // }

  // @override
  // Future<Either<Failure, ComboModel>> getCombo() async {
  //   try {
  //     final res = await controller.getCombo();
  //     final formatted = ComboModel.fromMap(res);
  //     saveBooksData(formatted.courses, kCourseBox);
  //     saveBooksData(formatted.sections, kSectionBox);
  //     saveBooksData(formatted.teachers, kTeacherBox);
  //     return Right(formatted);
  //   } catch (e) {
  //     return Left(formatFailure(e));
  //   }
  // }

  @override
  Future<Either<Failure, List<SectionModel>>> getSections() async {
    try {
      final res = await controller.getSections();
      final formatted = List.generate(
        res.length,
        (index) => SectionModel.fromMap(res[index]),
      );
      saveBooksData(formatted, kSectionBox);
      return Right(formatted);
    } catch (e) {
      return Left(formatFailure(e));
    }
  }

//   @override
//   Future<Either<Failure, List<TeacherModel>>> getTeachers() async {
//     try {
//       final res = await controller.getTeachers();
//       final formatted = List.generate(
//         res.length,
//         (index) => TeacherModel.fromMap(res[index]),
//       );
//       saveBooksData(formatted, kTeacherBox);
//       return Right(formatted);
//     } catch (e) {
//       return Left(formatFailure(e));
//     }
//   }
}
