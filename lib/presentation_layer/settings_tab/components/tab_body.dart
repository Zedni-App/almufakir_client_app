import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zidne/presentation_layer/login/controller/login_bloc.dart';

import '../../../core/utilities/navigators.dart';
import '../../profile_tab/controller/profile_bloc.dart';
import '../about_us_screen.dart';
import '../terms_screen.dart';
import 'brightness_switcher.dart';
import 'build_option.dart';

class TabBody extends StatelessWidget {
  const TabBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: [
        BlocBuilder<ProfileBloc, ProfileState>(
          buildWhen: (_, c) => c is AppThemeChanged,
          builder: (context, state) {
           
            return BuildOption(
              title: context.read<ProfileBloc>().isDark
                  ? "تفعيل الوضع النهاري"
                  : "تفعيل الوضع الليلي",
              icon: BrightnessSwitcher(showSun: context.read<ProfileBloc>().isDark),
              onPressed: () => context.read<ProfileBloc>().add(InvertAppMode()),
            );
          },
        ),
        BuildOption(
          title: "شروط الإستخدام",
          icon: const Icon(CupertinoIcons.exclamationmark_circle_fill),
          onPressed: () => pagePush(const TermsScreen()),
        ),
        BuildOption(
          title: "حول التطبيق",
          icon: const Icon(CupertinoIcons.exclamationmark_circle_fill),
          onPressed: () => pagePush(const AboutUsScreen()),
        ),
        BuildOption(
          title: "تسجيل الخروج",
          icon: const Icon(Icons.logout_outlined),
          onPressed: () =>
              context.read<LoginBloc>().add(LogoutEvent(manually: true)),
        ),
      ],
    );
  }
}
