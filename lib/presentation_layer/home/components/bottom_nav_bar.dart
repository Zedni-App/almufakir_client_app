import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/app_theme.dart';
import '../cubit/home_cubit.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (_, c) => c is ActiveTabChanged,
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return BottomNavigationBar(
          onTap: cubit.changeActiveTab,
          currentIndex: cubit.activeTab,
          selectedItemColor: AppColors.kPrimaryColor,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              label: "الرئيسية",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "الكورسات",
              icon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              label: "الملف الشخصي",
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: "الإشعارات",
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: "الإعدادات",
              icon: Icon(Icons.settings),
            ),
          ],
        );
      },
    );
  }
}
