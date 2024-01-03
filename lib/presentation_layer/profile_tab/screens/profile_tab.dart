import 'package:flutter/material.dart';

import '../../../core/app_styles/app_theme.dart';
import '../../../core/app_user.dart';
import '../../../core/utilities/formatters.dart';
import '../components/edit_profile_icon.dart';
import '../components/info_row.dart';
import '../components/user_image.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "الملف الشخصي",
          style: AppTheme.appbarTitleStyle(),
        ),
        centerTitle: true,
        actions: const [
          EditProfileIcon(),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          const UnconstrainedBox(
            child: UserImage(),
          ),
          InfoRow(
            title: "الإسم: ",
            value: "${appUser.fName} ${appUser.lName}",
          ),
          InfoRow(
            title: "الرقم: ",
            value: appUser.phone,
          ),
          InfoRow(
            title: "البريد الإلكتروني: ",
            value: appUser.email,
          ),
          InfoRow(
            title: "تاريخ الانضمام: ",
            value: formStringDate(appUser.regDate),
          ),
        ],
      ),
    );
  }
}
