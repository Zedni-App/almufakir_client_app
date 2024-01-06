import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

import '../../data_layer/controllers/course_controller.dart';
import '../../data_layer/controllers/courses_controller.dart';
import '../../data_layer/controllers/login_controller.dart';
import '../../data_layer/controllers/profile_controller.dart';
import '../../data_layer/dio_helper.dart';
import '../../data_layer/repositories/course_repository.dart';
import '../../data_layer/repositories/courses_repository.dart';
import '../../data_layer/repositories/login_repository.dart';
import '../../data_layer/repositories/profile_repository.dart';
import '../../domain_layer/repository/base_course_repo.dart';
import '../../domain_layer/repository/base_courses_repo.dart';
import '../../domain_layer/repository/base_login_repo.dart';
import '../../domain_layer/repository/base_profile_repo.dart';
import '../../domain_layer/use_cases/course/get_course_data.dart';
import '../../domain_layer/use_cases/courses/get_courses.dart';
import '../../domain_layer/use_cases/courses/get_sections.dart';
import '../../domain_layer/use_cases/login/login_user.dart';
import '../../domain_layer/use_cases/login/register_user.dart';
import '../../domain_layer/use_cases/profile/get_data.dart';
import '../../domain_layer/use_cases/profile/update_data.dart';
import '../../domain_layer/use_cases/profile/update_password.dart';
import '../../domain_layer/use_cases/profile/update_photo.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///USE CASES
    sl.registerLazySingleton(() => LoginUserUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUserUseCase(sl()));

    sl.registerLazySingleton(() => GetUserUseCase(sl()));
    sl.registerLazySingleton(() => UpdateUserDataUseCase(sl()));
    sl.registerLazySingleton(() => UpdateUserPhotoUseCase(sl()));
    sl.registerLazySingleton(() => UpdateUserPasswordUseCase(sl()));

    sl.registerLazySingleton(() => GetCoursesUseCase(sl()));
    sl.registerLazySingleton(() => GetCourseDataUseCase(sl()));
    sl.registerLazySingleton(() => GetSectionsUseCase(sl()));
    // sl.registerLazySingleton(() => GetTeachersUseCase(sl()));
    // sl.registerLazySingleton(() => GetComboUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseProfileRepo>(() => ProfileRepository(sl()));
    sl.registerLazySingleton<BaseCoursesRepo>(() => CoursesRepository(sl()));
    sl.registerLazySingleton<BaseCourseRepo>(() => CourseRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<LoginController>(() => LoginController(sl()));
    sl.registerLazySingleton<ProfileController>(() => ProfileController(sl()));
    sl.registerLazySingleton<CoursesController>(() => CoursesController(sl()));
    sl.registerLazySingleton<CourseController>(() => CourseController(sl()));

    ///DIO HELPER
    sl.registerLazySingleton<DioHelper>(() => DioHelper());
    sl.registerLazySingleton<DotEnv>(() => DotEnv());
  }
}
