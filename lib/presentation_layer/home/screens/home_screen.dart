import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_styles/theme.dart';
import '../../../more.dart';
import '../../../notifications.dart';
import '../../settings/settings_screen.dart';
import '../controller/home_bloc.dart';
import '../../courses_screen/components/sections_grid.dart';
import 'main_interface.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final pages = const [
    MainInterface(),
    CoursesGrid(),
    SettingsScreen(),
    Notifications(),
    More(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (_, c) => c is ActiveScreenChanged,
      builder: (context, state) {
        return Scaffold(
          body: pages[state is ActiveScreenChanged ? state.newIndex : 0],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) => context
                .read<HomeBloc>()
                .add(ChangeActiveScreen(newIndex: index)),
            currentIndex: state is ActiveScreenChanged ? state.newIndex : 0,
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
                label: "المزيد",
                icon: Icon(Icons.more),
              ),
            ],
          ),
        );
      },
    );
  }
}
