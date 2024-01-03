// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:zidne/core/app_styles/app_theme.dart';

// import '../../../core/app_styles/size_config.dart';
// import '../../../core/app_user.dart';
// import '../../../core/assets.dart';
// import 'edit_profile_icon.dart';

// class ProfileSliverAppBar extends StatefulWidget {
//   const ProfileSliverAppBar({super.key, required this.scrollCtrl});
//   final ScrollController scrollCtrl;
//   @override
//   State<ProfileSliverAppBar> createState() => _ProfileSliverAppBarState();
// }

// class _ProfileSliverAppBarState extends State<ProfileSliverAppBar> {
//   @override
//   void initState() {
//     widget.scrollCtrl.addListener(() => setState(() {}));
//     super.initState();
//   }

//   @override
//   void dispose() {
//     widget.scrollCtrl.removeListener(() {});
//     super.dispose();
//   }

//   bool isExpanded(double expandedHeight) {
//     return widget.scrollCtrl.hasClients &&
//         widget.scrollCtrl.offset < expandedHeight - kToolbarHeight;
//   }

//   double getHeight(double expandedHeight) {
//     return expandedHeight - widget.scrollCtrl.offset;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final expandedHeight = percentHeight(0.5);
//     return SliverAppBar(
//       actions: const [
//         EditProfileIcon(),
//       ],
//       flexibleSpace: isExpanded(expandedHeight)
//           ? BigUserImage(appBarHeight: getHeight(expandedHeight))
//           : null,
//       pinned: true,
//       floating: true,
//       expandedHeight: expandedHeight,
//       title: isExpanded(expandedHeight) ? null : const Text("الملف الشخصي"),
//     );
//   }
// }

// class BigUserImage extends StatelessWidget {
//   const BigUserImage({super.key, required this.appBarHeight});
//   final double appBarHeight;
//   @override
//   Widget build(BuildContext context) {
//     // return Stack(
//     //   children: [
//        return Container(
//           height: appBarHeight,
//           width: double.infinity,
//           margin: const EdgeInsets.only(bottom: 25),
//           color: AppTheme.isDark()
//               ? AppColors.dInfoRowColor
//               : AppColors.lInfoRowColor,
//           child: CachedNetworkImage(
//             imageUrl: appUser.imageUrl,
//             imageBuilder: (_, image) => Image(
//               image: image,
//               fit: BoxFit.cover,
//             ),
//             errorWidget: (_, __, ___) => UnconstrainedBox(
//               child: Image.asset(
//                 AppAssets.logo,
//                 width: percentWidth(0.5),
//               ),
//             ),
//           ),
//       //  ),
//       //   const ImageEditIcon(),
//       // ],
//     );
//   }
// }

// // class ImageEditIcon extends StatelessWidget {
// //   const ImageEditIcon({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Positioned(
// //       bottom: 0,
// //       left: 10,
// //       child: MaterialButton(
// //         onPressed: () async {
// //           final fromGallery = await selectImageSource(context);
// //           if (fromGallery == null) return; //no select
// //           if (context.mounted) {
// //             context.read<ProfileBloc>().add(UpdateUserImage(fromGallery));
// //           }
// //         },
// //         child: Container(
// //           height: 50,
// //           width: 50,
// //           decoration: const BoxDecoration(
// //             shape: BoxShape.circle,
// //             color: AppColors.kComplementColor2,
// //           ),
// //           child: const Icon(
// //             CupertinoIcons.camera_fill,
// //             size: 25,
// //             color: Colors.white,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
