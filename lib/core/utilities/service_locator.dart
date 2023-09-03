import 'package:get_it/get_it.dart';

import '../../data_layer/dio_helper.dart';
import '../../data_layer/login_controller.dart';
import '../../data_layer/login_repository.dart';
import '../../domain_layer/repository/base_login_repo.dart';
import '../../domain_layer/use_cases/login/login_user.dart';
import '../../domain_layer/use_cases/login/register_user.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    ///USE CASES
    sl.registerLazySingleton(() => LoginUserUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUserUseCase(sl()));

    ///REPOSITORY
    sl.registerLazySingleton<BaseLoginRepo>(() => LoginRepository(sl()));

    ///DATA SOURCE
    sl.registerLazySingleton<LoginController>(() => LoginController(sl()));

    ///DIO HELPER
    sl.registerLazySingleton<DioHelper>(() => DioHelper());
  }
}
