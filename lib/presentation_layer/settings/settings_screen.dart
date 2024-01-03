// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../core/app_styles/app_theme.dart';
// import '../../core/utilities/navigators.dart';
// import '../profile_tab/controller/profile_bloc.dart';
// import '../profile_tab/screens/profile_view_screen.dart';
// import 'components/brightness_switcher.dart';
// import 'components/option.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("الإعدادات", style: AppTheme.appbarTitleStyle()),
//         centerTitle: true,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(8),
//         children: [
//           BuildOption(
//             title: "الملف الشخصي",
//             icon: const Icon(
//               CupertinoIcons.person_crop_circle,
//               color: AppColors.kComplementColor2,
//               size: 30,
//             ),
//             onPressed: () => pagePush(
//               const ProfileViewScreen(),
//             ),
//           ),
//           BuildOption(
//               title: context.read<ProfileBloc>().isDark
//                   ? "الوضع الليلي"
//                   : "الوضع النهاري",
//               icon: const BrightnessSwitcher(),
//               onPressed: () {
//                 context.read<ProfileBloc>().add(InvertAppMode());
//               })
//         ],
//       ),
//     );
//   }
// }
