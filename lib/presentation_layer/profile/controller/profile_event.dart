part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class PickImage extends ProfileEvent {
  final bool fromGallery;

  PickImage(this.fromGallery);
}

class UpdateUserImage extends ProfileEvent {
  final File newImage;

  UpdateUserImage(this.newImage);
}

class UpdateUserData extends ProfileEvent {
 final UserEntity newData;

  UpdateUserData(this.newData);
}

class GetUserData extends ProfileEvent {
  final String userEmail;

  GetUserData(this.userEmail);
}
