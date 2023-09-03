import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zidne/domain_layer/use_cases/login/register_user.dart';
import '../../../../core/utilities/service_locator.dart';
import '../../../../domain_layer/use_cases/login/login_user.dart';
import '../../../core/enums.dart';
import '../../../core/utilities/short_method.dart';
import '../../home/home_screen.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvents, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(_login);
    on<RegisterEvent>(_register);
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
        pageReplacement(const HomeScreen());
        emit(LoginRequest(requestState: ProcessState.done));
      },
    );
  }

  FutureOr<void> _register(
      RegisterEvent event, Emitter<LoginState> emit) async {
    emit(RegisterRequest(requestState: ProcessState.processing));
    final res = await sl<RegisterUserUseCase>()
        .call(email: event.email, name: event.name, password: event.password);
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
        pageReplacement(const HomeScreen());
        emit(RegisterRequest(requestState: ProcessState.done));
      },
    );
  }

  FutureOr<void> _invertShowState(
      InvertShowPass event, Emitter<LoginState> emit) {
    hidePass = !hidePass;
    emit(InvertPassHideState());
  }
}
