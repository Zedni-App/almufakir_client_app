import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zidne/presentation_layer/login/screens/login.dart';

import 'core/app_styles/theme.dart';
import 'core/utilities/service_locator.dart';
import 'data_layer/shared_preferences.dart';
import 'presentation_layer/login/controller/login_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppSp.init();
  ServicesLocator().init();
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
      ],
      child: MaterialApp(
        title: 'Zidne',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
          buttonTheme: ButtonThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: lPrimaryColor1),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(lPrimaryColor1),
            ),
          ),
        ),
        navigatorKey: navKey,
        builder: (context, child) =>
            Directionality(textDirection: TextDirection.rtl, child: child!),
        home: const LoginScreen(),
      ),
    );
  }
}
