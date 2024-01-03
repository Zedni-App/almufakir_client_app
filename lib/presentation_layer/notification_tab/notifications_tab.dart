import 'package:flutter/material.dart';

import '../../core/app_styles/app_theme.dart';
import 'components/no_notification.dart';

class NotificationsTab extends StatefulWidget {
  const NotificationsTab({Key? key}) : super(key: key);

  @override
  State<NotificationsTab> createState() => _NotificationsTabState();
}

class _NotificationsTabState extends State<NotificationsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
