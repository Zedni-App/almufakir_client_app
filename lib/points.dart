// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:zedni/const/Theme.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

// class Points extends StatefulWidget {
//   const Points({Key? key}) : super(key: key);

//   @override
//   State<Points> createState() => _PointsState();
// }

// class _PointsState extends State<Points> {
  
//   List idleb = [
//     {
//       "name": "مكتبة ادلب",
//       "address": "ادلب",
//       "phone": "0912334876",
//     },
//     {
//       "name": "مكتبة ادلب2",
//       "address": "الجميلية",
//       "phone": "0912334876",
//     },
//     {
//       "name": "مركز ادلب",
//       "address": "الأعظمية",
//       "phone": "0912334876",
//     },
//     {
//       "name": "ماركت ادلب",
//       "address": "الميدان",
//       "phone": "0912334876",
//     }
//   ];
//   List aleppo = [
//     {
//       "name": "مكتبة الكشاف",
//       "address": "أدونيس",
//       "phone": "0912334876",
//     },
//     {
//       "name": "مكتبة أطلس",
//       "address": "الجميلية",
//       "phone": "0912334876",
//     },
//     {
//       "name": "مركز الأمين",
//       "address": "الأعظمية",
//       "phone": "0912334876",
//     },
//     {
//       "name": "ماركت عمار",
//       "address": "الميدان",
//       "phone": "0912334876",
//     }
//   ];
//   var names = [
//     "مكتبة الكشاف",
//     "مكتبة أطلس",
//     "مركز الأمين",
//     "ماركت عمار",
//   ];
//   var address = [
//     "أدونيس",
//     "الجميلية",
//     "الأعظمية",
//     "الميدان",
//   ];
//   var phones = [
//     "0911229456",
//     "0911229456",
//     "0911229456",
//     "0911229456",
//   ];
//   var gov = [
//     "ادلب",
//     "حماه",
//     "حلب",
//     "دمشق",
//   ];

//   Icon ic1 = Icon(
//     Icons.store_rounded,
//     color: lprimarycolor2.withOpacity(0.8),
//     size: 100,
//   );
//   Icon ic2 = Icon(
//     Icons.sunny,
//     color: lprimarycolor1,
//     size: 100,
//   );
//   String selecteditem = "";

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
//     final double itemWidth = size.width / 2;

//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(size.height * 0.03),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               margin: EdgeInsets.only(
//                   left: size.height * 0.03, right: size.height * 0.03),
//               child: DropdownSearch<String>(
          
//                 popupProps: PopupProps.menu(
//                   showSearchBox: true,
//                   showSelectedItems: true,
//                   disabledItemFn: (String s) => s.startsWith("ل"),
//                 ),
//                 items: gov,
//                 dropdownDecoratorProps: DropDownDecoratorProps(
//                   dropdownSearchDecoration: InputDecoration(
//                     hintTextDirection: TextDirection.rtl,
//                     labelText: "المحافظة",
//                     hintText: "اختر المحافظة",
//                   ),
//                 ),
//                 onChanged: (val) {
//                   setState(() {
//                     selecteditem == val;
//                   });
//                 },
//                 selectedItem: selecteditem,
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.all(size.height * 0.03),
//               child: GridView.count(
//                 childAspectRatio: (itemWidth / itemHeight),
//                 shrinkWrap: true,
//                 crossAxisCount: 2,
//                 mainAxisSpacing: size.width * 0.04,
//                 crossAxisSpacing: size.width * 0.04,
//                 children: [
//                   componentInterface(
//                       1,
//                       selecteditem == "ادلب"
//                           ? "${idleb[0]["name"]}"
//                           : selecteditem == "حلب"
//                               ? "${aleppo[0]["name"]}"
//                               : selecteditem == "حماه"
//                                   ? "ooo"
//                                   : "aaa",
//                       address[0],
//                       phones[0],
//                       ic1),
//                   componentInterface(1, names[1], address[2], phones[1], ic1),
//                   componentInterface(1, names[2], address[2], phones[2], ic1),
//                   componentInterface(1, names[3], address[3], phones[3], ic1),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget componentInterface(
//       int id, String componame, String address, String phone, Icon ic) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       decoration: BoxDecoration(
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 offset: Offset(0.0, 3.0),
//                 blurRadius: 5.0,
//                 spreadRadius: 0.07,
//                 blurStyle: BlurStyle.normal)
//           ],
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(size.height * 0.01)),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ic,
//           SizedBox(
//             height: size.height * 0.03,
//           ),
//           Text(
//             componame,
//             style: TextStyle(
//                 color: lprimarycolor1,
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: size.height * 0.001,
//           ),
//           Text(
//             address,
//             style: TextStyle(
//                 color: Colors.grey, fontSize: 14, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(
//             height: size.height * 0.004,
//           ),
//           GestureDetector(
//             onTap: () async {
//               await FlutterPhoneDirectCaller.callNumber("0958771459");
//             },
//             child: Text(
//               phone,
//               style: TextStyle(
//                   decoration: TextDecoration.underline,
//                   color: Colors.blueGrey,
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//           SizedBox(
//             height: size.height * 0.001,
//           ),
//         ],
//       ),
//     );
//   }
// }
