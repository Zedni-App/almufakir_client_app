part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class ShowHidePass extends ProfileEvent {
  final bool show;

  ShowHidePass(this.show);
}

class UpdateUserName extends ProfileEvent {
  final String newName;
  final String newNick;

  UpdateUserName({required this.newName, required this.newNick});
}

class UpdateUserImage extends ProfileEvent {
  final bool fromGallery;

  UpdateUserImage(this.fromGallery);
}

class UpdateUserEmail extends ProfileEvent {
  final String newEmail;

  UpdateUserEmail({required this.newEmail});
}

class UpdateUserPhone extends ProfileEvent {
  final String newPhone;

  UpdateUserPhone({required this.newPhone});
}

class UpdateUserPassword extends ProfileEvent {
  final String oldPass;
  final String newPass;

  UpdateUserPassword({required this.oldPass, required this.newPass});
}

class GetUserData extends ProfileEvent {
  final String userEmail;

  GetUserData(this.userEmail);
}

class InvertAppMode extends ProfileEvent {
  InvertAppMode();
}
