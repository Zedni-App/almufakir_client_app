// import 'package:flutter/material.dart';
//
// class Element_Course extends StatefulWidget {
//   const Element_Course({Key? key}) : super(key: key);
//
//   @override
//   State<Element_Course> createState() => _Element_CourseState();
// }
//
// class _Element_CourseState extends State<Element_Course> {
//   double coursecost = 1500000;
//   int rate = 0;
//
//   var elementname = ["رياضيات", "فيزياء", "كيمياء", "علوم"];
//   var elementprice = [200000.0, 150000.0, 170000.0, 200000.0];
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: ListView(
//           shrinkWrap: true,
//           padding: EdgeInsets.all(size.width * 0.01),
//           children: [
//             Container(
//               padding: EdgeInsets.all(size.width * 0.03),
//               color: lprimarycolor4,
//               height: size.height * 0.3,
//               width: double.infinity,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//                     Text(
//                       " ل.س",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red),
//                       textDirection: TextDirection.rtl,
//                     ),
//                     Text(
//                       coursecost.toString(),
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.red),
//                       textDirection: TextDirection.rtl,
//                     ),
//                     Text(
//                       "سعر الكورس : ",
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                       textDirection: TextDirection.rtl,
//                     ),
//                   ]),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Rate(
//                         color: Colors.orange,
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: size.height * 0.01,
//                   ),
//                   Container(
//                       width: double.infinity,
//                       height: size.height * 0.05,
//                       child: MaterialButton(
//                         onPressed: () {},
//                         color: lprimarycolor1,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Icon(
//                               Icons.shopping_cart_outlined,
//                               color: Colors.white,
//                             ),
//                             Text(
//                               "شراء الكورس",
//                               style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white),
//                               textDirection: TextDirection.rtl,
//                             ),
//                           ],
//                         ),
//                       )),
//                 ],
//               ),
//             ),
//             Container(
//               padding: EdgeInsets.all(size.width * 0.03),
//               child: GridView(
//                 shrinkWrap: true,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     mainAxisSpacing: size.width * 0.04,
//                     crossAxisSpacing: size.width * 0.04),
//                 children: [
//                   elementsCourse(elementname[0], elementprice[0], 0),
//                   elementsCourse(elementname[1], elementprice[1], 1),
//                   elementsCourse(elementname[2], elementprice[2], 2),
//                   elementsCourse(elementname[3], elementprice[3], 3),
//                 ],
//               ),
//             )
//           ]),
//     );
//   }
//
//   Widget elementsCourse(String elementname, double elementprice, int id) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//         child: Container(
//           padding: EdgeInsets.all(size.width * 0.03),
//           color: lprimarycolor4,
//           height: size.height * 0.3,
//           width: double.infinity,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Text(
//                   elementname,
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: lprimarycolor1),
//                   textDirection: TextDirection.rtl,
//                 ),
//               ]),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                 Text(
//                   " ل.س",
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red),
//                   textDirection: TextDirection.rtl,
//                 ),
//                 Text(
//                   elementprice.toString(),
//                   style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.red),
//                   textDirection: TextDirection.rtl,
//                 ),
//                 Text(
//                   "سعر المادة : ",
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   textDirection: TextDirection.rtl,
//                 ),
//               ]),
//               SizedBox(
//                 height: size.height * 0.01,
//               ),
//               Container(
//                   width: double.infinity,
//                   height: size.height * 0.05,
//                   child: MaterialButton(
//                     onPressed: () {},
//                     color: lprimarycolor1,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(
//                           Icons.shopping_cart_outlined,
//                           color: Colors.white,
//                         ),
//                         Text(
//                           "شراء المادة",
//                           style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white),
//                           textDirection: TextDirection.rtl,
//                         ),
//                       ],
//                     ),
//                   )),
//             ],
//           ),
//         ),
//         width: size.width * 0.8,
//         height: size.height * 0.8,
//         decoration: BoxDecoration(
//           // image: DecorationImage(
//           //   image: AssetImage("assets/images/scourse.jpg"),
//           //   fit: BoxFit.cover,
//           //   colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
//           // ),
//           color: lprimarycolor1,
//           borderRadius: BorderRadius.all(Radius.circular(size.width * 0.008)),
//         ));
//   }
// }
