import 'package:flutter/material.dart';


class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Notify")],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedindex,
      //   selectedItemColor: lprimarycolor1,
      //   unselectedItemColor: Colors.grey,
      //   onTap: (index) {
      //     setState(() {
      //       selectedindex = index;
      //     });
      //   },
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
