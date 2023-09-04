import 'package:get_it/get_it.dart';

import '../../data_layer/controllers/profile_controller.dart';
import '../../data_layer/dio_helper.dart';
import '../../data_layer/controllers/login_controller.dart';
import '../../data_layer/reositories/login_repository.dart';
import '../../data_layer/reositories/profile_repository.dart';
import '../../domain_layer/repository/base_login_repo.dart';
import '../../domain_layer/repository/base_profile_repo.dart';
import '../../domain_layer/use_cases/login/login_user.dart';
import '../../domain_layer/use_cases/login/register_user.dart';
import '../../domain_layer/use_cases/profile/get_data.dart';
import '../../domain_layer/use_cases/profile/update_data.dart';
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

    ///REPOSITORY
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepository(sl()));
    sl.registerLazySingleton<BaseProfileRepo>(() => ProfileRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<LoginController>(() => LoginController(sl()));
    sl.registerLazySingleton<ProfileController>(() => ProfileController(sl()));

    ///DIO HELPER
    sl.registerLazySingleton<DioHelper>(() => DioHelper());
  }
}
