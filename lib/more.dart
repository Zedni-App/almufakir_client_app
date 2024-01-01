import 'package:flutter/material.dart';
// import 'package:zedni/screens/screens.dart';

class More extends StatefulWidget {
  const More({Key? key}) : super(key: key);

  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("More")],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: lprimarycolor1,
      //   unselectedItemColor: Colors.grey,
      //   onTap: (index) {
      //     setState(() {
      //       selectedindex = index;
      //     });
      //   },
      //   currentIndex: selectedindex,
      //   items: [
      //     BottomNavigationBarItem(
      //         label: "المزيد",
      //         icon: IconButton(
      //           onPressed: () {
      //             Navigator.of(context).pushReplacementNamed("More");
      //           },
      //           icon: Icon(Icons.more),
      //         )),
      //     BottomNavigationBarItem(
      //         label: "الإشعارات",
      //         icon: IconButton(
      //           onPressed: () {
      //             Navigator.of(context).pushReplacementNamed("Notifications");
      //           },
      //           icon: Icon(Icons.notifications),
      //         )),
      //     BottomNavigationBarItem(
      //         label: "البروفايل",
      //         icon: IconButton(
      //           onPressed: () {
      //             Navigator.of(context).pushReplacementNamed("Profile");
      //           },
      //           icon: Icon(Icons.person),
      //         )),
      //     BottomNavigationBarItem(
      //         label: "الكورسات",
      //         icon: IconButton(
      //             onPressed: () {
      //               Navigator.of(context).pushReplacementNamed("Courses");
      //             },
      //             icon: Icon(Icons.book))),
      //     BottomNavigationBarItem(
      //         label: "الرئيسية",
      //         icon: IconButton(
      //             onPressed: () {
      //               Navigator.of(context)
      //                   .pushReplacementNamed("MainInterface");
      //             },
      //             icon: Icon(Icons.house))),
      //   ],
      // )
    );
  }
}
