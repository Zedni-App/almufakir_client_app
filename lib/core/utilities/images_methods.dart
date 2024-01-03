import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../app_styles/app_theme.dart';

Future<File?> pickProfileImage(bool fromGallery) async {
  final pickedImage = await pickImage(fromGallery);
  if (pickedImage == null) return null;
  final croppedImage = await cropImage(pickedImage);
  final compressedImage = await compressImage(croppedImage, pickedImage);
  return File(
    compressedImage?.path ?? croppedImage?.path ?? pickedImage.path,
  );
}

Future<XFile?> pickImage(bool fromGallery) async {
  return await ImagePicker().pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera);
}

Future<CroppedFile?> cropImage(XFile pickedFile) async {
  return await ImageCropper().cropImage(
    sourcePath: pickedFile.path,
    aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'إقتصاص الصورة',
        toolbarColor: AppColors.kPrimaryColor,
        toolbarWidgetColor: Colors.white,
        lockAspectRatio: true,
      ),
      IOSUiSettings(
        title: 'إقتصاص الصورة',
        aspectRatioLockEnabled: true,
        resetAspectRatioEnabled: false,
        showCancelConfirmationDialog: false,
      ),
    ],
  );
}

Future<XFile?> compressImage(CroppedFile? croppedFile, XFile pickedFile) async {
  final String targetPath = getTargetPath(croppedFile, pickedFile);
  return await FlutterImageCompress.compressAndGetFile(
    croppedFile?.path ?? pickedFile.path,
    targetPath,
    format: CompressFormat.jpeg,
    quality: 70,
  );
}

String getTargetPath(CroppedFile? croppedFile, XFile pickedFile) {
  String targetPath = '';
  final pathList = (croppedFile?.path ?? pickedFile.path).split("/");
  final directoryPathList = pathList.sublist(0, pathList.length - 2);
  for (var d in directoryPathList) {
    targetPath = '$targetPath$d/';
  }
  targetPath = "${targetPath}compressed${Random().nextInt(50)}.jpeg";
  return targetPath;
}
