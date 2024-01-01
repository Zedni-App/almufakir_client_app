import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import '../../../core/app_styles/theme.dart';

confirmDialog(BuildContext context) async {
  bool confirmed = false;
  await AwesomeDialog(
    context: context,
    btnOkColor: AppColors.lprimarycolor2,
    btnOkText: "نعم",
    btnCancelColor: Colors.grey,
    btnCancelText: "لا",
    dialogType: DialogType.warning,
    animType: AnimType.rightSlide,
    title: 'تنبيه',
    desc: 'هل تريد حفظ التعديلات؟',
    btnCancelOnPress: () {},
    btnOkOnPress: () {
      confirmed = true;
    },
  ).show();
  return confirmed;
}
