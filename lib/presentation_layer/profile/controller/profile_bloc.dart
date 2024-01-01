import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zidne/data_layer/shared_preferences.dart';

import '../../../core/app_user.dart';
import '../../../core/enums.dart';
import '../../../core/utilities/images_methods.dart';
import '../../../core/utilities/service_locator.dart';
import '../../../domain_layer/use_cases/profile/update_data.dart';
import '../../../domain_layer/use_cases/profile/update_password.dart';
import '../../../domain_layer/use_cases/profile/update_photo.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<UpdateUserName>(_updateName);
    on<UpdateUserPassword>(_updatePass);
    on<UpdateUserEmail>(_updateEmail);
    on<UpdateUserPhone>(_updatePhone);
    on<UpdateUserImage>(_updateImage);
    on<ShowHidePass>(_invertShowState);
    on<InvertAppMode>(_invertThemeMode);
  }

  bool isDark = AppSp.getBool(SPVars.isDark);

  FutureOr<void> _updateImage(UpdateUserImage event, Emitter emit) async {
    final File? pickedFile = await pickProfileImage(event.fromGallery);
    if (pickedFile == null) return;
    emit(const UpdateUserImageState(processState: ProcessState.processing));
    final uploadRes =
        await sl<UpdateUserPhotoUseCase>().call(image: pickedFile);
    uploadRes.fold((l) {
      emit(
        UpdateUserImageState(
          processState: ProcessState.failed,
          resultMessage: l.message,
        ),
      );
    }, (r) {
      updateAppUser(imageUrl: r);

      emit(
        UpdateUserImageState(
          processState: ProcessState.done,
          resultMessage: r,
        ),
      );
    });
  }

  FutureOr<void> _updatePhone(
      UpdateUserPhone event, Emitter<ProfileState> emit) async {
    emit(const UpdateUserPhoneState(processState: ProcessState.processing));
    final uploadRes = await sl<UpdateUserDataUseCase>().call(
      user: appUser.copyWith(phone: event.newPhone),
    );
    uploadRes.fold((l) {
      emit(
        UpdateUserPhoneState(
          processState: ProcessState.failed,
          resultMessage: l.message,
        ),
      );
    }, (r) {
      updateAppUser(phone: event.newPhone);
      emit(
        UpdateUserPhoneState(
          processState: ProcessState.done,
          resultMessage: r,
        ),
      );
    });
  }

  FutureOr<void> _updateEmail(
      UpdateUserEmail event, Emitter<ProfileState> emit) async {
    emit(const UpdateUserEmailState(processState: ProcessState.processing));
    final uploadRes = await sl<UpdateUserDataUseCase>()
        .call(user: appUser.copyWith(phone: event.newEmail));
    uploadRes.fold((l) {
      emit(
        UpdateUserEmailState(
          processState: ProcessState.failed,
          resultMessage: l.message,
        ),
      );
    }, (r) {
      updateAppUser(email: event.newEmail);
      emit(
        UpdateUserEmailState(
          processState: ProcessState.done,
          resultMessage: r,
        ),
      );
    });
  }

  FutureOr<void> _updateName(
      UpdateUserName event, Emitter<ProfileState> emit) async {
    emit(const UpdateUserNameState(processState: ProcessState.processing));
    final uploadRes = await sl<UpdateUserDataUseCase>().call(
      user: appUser.copyWith(
        fName: event.newName,
        lName: event.newNick,
      ),
    );
    uploadRes.fold((l) {
      emit(
        UpdateUserNameState(
          processState: ProcessState.failed,
          resultMessage: l.message,
        ),
      );
    }, (r) {
      updateAppUser(fName: event.newName, lName: event.newNick);
      emit(
        UpdateUserNameState(
          processState: ProcessState.done,
          resultMessage: r,
        ),
      );
    });
  }

  FutureOr<void> _updatePass(
      UpdateUserPassword event, Emitter<ProfileState> emit) async {
    emit(const UpdateUserPassState(processState: ProcessState.processing));
    final uploadRes = await sl<UpdateUserPasswordUseCase>().call(
      currentPassword: event.oldPass,
      newPassword: event.newPass,
    );
    uploadRes.fold((l) {
      emit(
        UpdateUserPassState(
          processState: ProcessState.failed,
          resultMessage: l.message,
        ),
      );
    }, (r) {
      emit(
        UpdateUserPassState(
          processState: ProcessState.done,
          resultMessage: r,
        ),
      );
    });
  }

  FutureOr<void> _invertShowState(
      ShowHidePass event, Emitter<ProfileState> emit) {
    emit(InvertPassHideState(event.show));
  }

  FutureOr<void> _invertThemeMode(
      InvertAppMode event, Emitter<ProfileState> emit) {
    isDark = !isDark;
    AppSp.setBool(
      key: SPVars.isDark,
      value: isDark,
    );
    emit(AppThemeChanged(isDark: isDark));
  }
}
