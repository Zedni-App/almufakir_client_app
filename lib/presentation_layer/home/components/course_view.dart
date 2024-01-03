// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';

// import '../../../core/app_styles/size_config.dart';
// import '../../../core/app_styles/theme.dart';
// import '../../../core/utilities/navigators.dart';
// import '../../../domain_layer/entities/course_entity.dart';
// import '../screens/course_view_screen.dart';

// class CourseView extends StatelessWidget {
//   const CourseView(this.course, {super.key});

//   final CourseEntity course;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => pagePush(CourseViewScreen(course)),
//       child: Container(
//         width: percentWidth(0.8),
//         height: percentHeight(0.8),
//         decoration: BoxDecoration(
//           border: Border.all(color: AppColors.kPrimaryColor, width: 3),
//           image: DecorationImage(
//             image: CachedNetworkImageProvider(course.imageURL),
//             fit: BoxFit.cover,
//             colorFilter:
//                 const ColorFilter.mode(Colors.black54, BlendMode.darken),
//           ),
//           borderRadius: BorderRadius.all(Radius.circular(percentWidth(0.03))),
//         ),
//         child: Center(
//           child: Text(
//             course.name,
//             style: const TextStyle(
//                 color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }
