import 'package:flutter/material.dart';

import '../../core/app_styles/app_theme.dart';
import 'components/no_notification.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppBar(
            title: Text(
              "الإشعارات",
              style: AppTheme.appbarTitleStyle(),
            ),
            centerTitle: true,
          ),
          const Expanded(child: NoNotification()),
        ],
      ),
    );
  }
}
