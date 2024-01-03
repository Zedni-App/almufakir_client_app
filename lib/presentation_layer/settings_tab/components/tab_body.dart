import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/app_theme.dart';
import '../../profile_tab/controller/profile_bloc.dart';
import 'brightness_switcher.dart';
import 'build_option.dart';

class TabBody extends StatelessWidget {
  const TabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        BuildOption(
          title:
              AppTheme.isDark() ? "تفعيل الوضع النهاري" : "تفعيل الوضع الليلي",
          icon: const BrightnessSwitcher(),
          onPressed: () => context.read<ProfileBloc>().add(InvertAppMode()),
        ),
        BuildOption(
          title: "شروط الإستخدام",
          icon: const BrightnessSwitcher(),
          onPressed: () {},
        ),
        BuildOption(
          title: "حول التطبيق",
          icon: const BrightnessSwitcher(),
          onPressed: () {},
        ),
        BuildOption(
          title: "تسجيل الخروج",
          icon: const BrightnessSwitcher(),
          onPressed: () => context.read<ProfileBloc>().add(InvertAppMode()),
        ),
      ],
    );
  }
}
