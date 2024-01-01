import 'package:flutter/material.dart';
import 'package:zedni/screens/screens.dart';

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  int selectedIndex = 4;
  List<Widget> widgetPages = [
    More(),
    Notifications(),
    Profile(),
    Courses(),
    MainInterface(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (index) => setState(() => selectedIndex = index),
          currentIndex: selectedIndex,
          selectedItemColor: lprimarycolor1,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              label: "المزيد",
              icon: Icon(Icons.more),
            ),
            BottomNavigationBarItem(
              label: "الإشعارات",
              icon: Icon(Icons.notifications),
            ),
            BottomNavigationBarItem(
              label: "الملف الشخصي",
              icon: Icon(Icons.person),
            ),
            BottomNavigationBarItem(
              label: "الكورسات",
              icon: Icon(Icons.book),
            ),
            BottomNavigationBarItem(
              label: "الرئيسية",
              icon: Icon(Icons.home),
            ),
          ]),
      body: widgetPages.elementAt(selectedIndex),
    );
  }
}
