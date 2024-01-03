import 'package:flutter/material.dart';

import '../../core/app_styles/app_theme.dart';
import 'components/tab_body.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({Key? key}) : super(key: key);

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          title: Text(
            "الإعدادات",
            style: AppTheme.appbarTitleStyle(),
          ),
          centerTitle: true,
        ),
        const Expanded(child: TabBody()),
      ],
    );
  }
}

