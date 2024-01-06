import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zidne/data_layer/hive_helper.dart';
import 'package:zidne/data_layer/shared_preferences.dart';
import 'package:zidne/domain_layer/entities/user_entity.dart';
import 'package:zidne/domain_layer/use_cases/login/register_user.dart';
import 'package:zidne/domain_layer/use_cases/profile/get_data.dart';

import '../../../../core/utilities/service_locator.dart';
import '../../../../domain_layer/use_cases/login/login_user.dart';
import '../../../core/enums.dart';
import '../../../core/utilities/navigators.dart';
import '../../home/home_screen.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
    on<LogoutEvent>(_logout);
    on<InvertShowPass>(_invertShowState);
  }

  bool hidePass = true;

  FutureOr<void> _login(LoginEvent event, Emitter<LoginState> emit) async {
    emit(LoginRequest(requestState: ProcessState.processing));
    final res = await sl<LoginUserUseCase>()
        .call(email: event.email, password: event.password);
    res.fold(
      (l) {
        showMessage(l.message);
        emit(
          LoginRequest(
            requestState: ProcessState.failed,
            resultMessage: l.message,
          ),
        );
      },
      (r) {
        showMessage(r);
        AppSp.setBool(key: SPVars.loggedIn, value: true);
        pageReplacement(const HomeScreen());
        emit(LoginRequest(requestState: ProcessState.done));
        _getUserData(
          email: event.email,
          password: event.password,
        );
      },
    );
  }

  FutureOr<void> _register(
      RegisterEvent event, Emitter<LoginState> emit) async {
    emit(RegisterRequest(requestState: ProcessState.processing));
    final res = await sl<RegisterUserUseCase>().call(user: event.newUser);
    res.fold(
      (l) {
        showMessage(l.message);
        emit(
          RegisterRequest(
            requestState: ProcessState.failed,
            resultMessage: l.message,
          ),
        );
      },
      (r) {
        showMessage(r);
        AppSp.setBool(key: SPVars.loggedIn, value: true);
        pageReplacement(const HomeScreen());
        emit(RegisterRequest(requestState: ProcessState.done));
        _getUserData(
          email: event.newUser.email,
          password: event.newUser.password,
        );
        emit(RegisterRequest(requestState: ProcessState.done));
      },
    );
  }

  _getUserData({required String email, required String password}) async {
    await sl<GetUserUseCase>().call(email: email, password: password);
  }

  FutureOr<void> _invertShowState(
      InvertShowPass event, Emitter<LoginState> emit) {
    hidePass = !hidePass;
    emit(InvertPassHideState());
  }

  FutureOr<void> _logout(LogoutEvent event, Emitter<LoginState> emit) async {
     await AppSp.clear();

    await HiveHelper.clear();
    emit(LogoutDone(message: event.manually?"تم تسجيل الخروج بنجاح":"تم تسجيل الخروج بسبب انتهاء صلاحية الجلسة"));
  }
}
