import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/app_styles/app_theme.dart';
import 'core/utilities/service_locator.dart';
import 'data_layer/hive_helper.dart';
import 'data_layer/shared_preferences.dart';
import 'presentation_layer/home/home_screen.dart';
import 'presentation_layer/login/controller/login_bloc.dart';
import 'presentation_layer/login/screens/login.dart';
import 'presentation_layer/profile_tab/controller/profile_bloc.dart';
import 'presentation_layer/sections_tab/cubit/sections_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSp.init();
  ServicesLocator().init();
  await sl<DotEnv>().load();
  await initHive();
  runApp(const MyApp());
}

final navKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginBloc()),
        BlocProvider(create: (_) => SectionsCubit()),
        BlocProvider(create: (_) => ProfileBloc()),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Almufakir',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.getTheme(context.read<ProfileBloc>().isDark),
            navigatorKey: navKey,
            builder: (context, child) =>
                Directionality(textDirection: TextDirection.rtl, child: child!),
            home: AppSp.getBool(SPVars.loggedIn)
                ? const HomeScreen()
                : const LoginScreen(),
          );
        },
      ),
    );
  }
}
