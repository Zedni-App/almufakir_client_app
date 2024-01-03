import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    on<InvertShowPass>(_invertShowState);
    on<GetUserDataEvent>(_getData);
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
        add(GetUserDataEvent(email: event.email, password: event.password));
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
        add(GetUserDataEvent(
            email: event.newUser.email, password: event.newUser.password));
      },
    );
  }

  FutureOr<void> _getData(
      GetUserDataEvent event, Emitter<LoginState> emit) async {
    emit(GetUserDataRequest(requestState: ProcessState.processing));
    final res = await sl<GetUserUseCase>()
        .call(email: event.email, password: event.password);
    res.fold(
      (l) {
        showMessage(l.message);
        emit(
          GetUserDataRequest(
            requestState: ProcessState.failed,
            resultMessage: l.message,
          ),
        );
      },
      (r) => emit(GetUserDataRequest(requestState: ProcessState.done)),
    );
  }

  FutureOr<void> _invertShowState(
      InvertShowPass event, Emitter<LoginState> emit) {
    hidePass = !hidePass;
    emit(InvertPassHideState());
  }
}
