import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/bottom_nav_bar.dart';
import 'components/tabs.dart';
import 'cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
          buildWhen: (_, c) => c is ActiveTabChanged,
          builder: (context, state) {
            final index = context.read<HomeCubit>().activeTab;
            return tabs[index];
          },
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
