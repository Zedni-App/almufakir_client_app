// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../core/enums.dart';
// import '../../../core/utilities/navigators.dart';
// import '../controller/profile_bloc.dart';
// import '../screens/profile_edit_email.dart';
// import '../screens/profile_edit_name.dart';
// import '../screens/profile_edit_password.dart';
// import '../screens/profile_edit_phone.dart';
// import 'image_source_selector.dart';

// class EditProfileIcon extends StatelessWidget {
//   const EditProfileIcon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//       itemBuilder: (_) => Edits.values
//           .map((e) => PopupMenuItem(value: e, child: Text(e.inArabic)))
//           .toList(),
//       icon: const Icon(
//         CupertinoIcons.pen,
//       ),
//       iconSize: 30,
//       onSelected: (value) => _takeAction(value, context),
//     );
//   }

//   void _takeAction(Edits value, BuildContext context) async {
//     switch (value) {
//       case Edits.image:
//         final fromGallery = await selectImageSource(context);
//         if (fromGallery == null) return; //no select
//         if (context.mounted) {
//           context.read<ProfileBloc>().add(UpdateUserImage(fromGallery));
//         }
//         return;
//       case Edits.name:
//         pagePush(const ProfileEditName());
//         return;
//       case Edits.phone:
//         pagePush(const ProfileEditPhone());
//         return;
//       case Edits.email:
//         pagePush(const ProfileEditEmail());
//         return;
//       case Edits.password:
//         pagePush(const ProfileEditPassword());
//         return;
//     }
//   }
// }
