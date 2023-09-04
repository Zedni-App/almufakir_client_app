import 'dart:async';
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/enums.dart';
import '../../../core/utilities/images_methods.dart';
import '../../../domain_layer/entities/user_entity.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<PickImage>(_pickImage);
  }

  FutureOr<void> _pickImage(PickImage event, Emitter emit) async {
    final File? pickedFile = await pickProfileImage(event.fromGallery);
    if(pickedFile==null){

    }
  }

  Future<File?> pickProfileImage(bool fromGallery) async {
    final pickedImage = await pickImage(fromGallery);
    if (pickedImage == null) return null;
    final croppedImage = await cropImage(pickedImage);
    final compressedImage = await compressImage(croppedImage, pickedImage);
    return File(
      compressedImage?.path ?? croppedImage?.path ?? pickedImage.path,
    );
  }
}
