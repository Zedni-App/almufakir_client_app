import 'package:flutter/material.dart';
import 'package:zedni/screens/screens.dart';

class Course_Content extends StatefulWidget {
  const Course_Content({Key? key}) : super(key: key);

  @override
  State<Course_Content> createState() => _Course_ContentState();
}

class _Course_ContentState extends State<Course_Content> {
  String elementnamea1 = "رياضيات";
  String elementnamea2 = "فيزياء";
  String elementnamea3 = "كيمياء";
  String elementnamea4 = "علوم";

  String elementnameb1 = "جغرافية";
  String elementnameb2 = "تاريخ";
  String elementnameb3 = "عربي";
  String elementnameb4 = "فلسفة";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(size.width * 0.04),
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: size.width * 0.04,
            crossAxisSpacing: size.width * 0.04),
        children: [
          elementsCourse(elementnamea1),
          elementsCourse(elementnamea2),
          elementsCourse(elementnamea3),
          elementsCourse(elementnamea4),
        ],
      ),
    ));
  }

  Widget elementsCourse(String elementname) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Center(
          child: Text(
            elementname,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        width: size.width * 0.8,
        height: size.height * 0.8,
        decoration: BoxDecoration(
          border: Border.all(color: lprimarycolor2, width: 3),
          image: DecorationImage(
            image: AssetImage("assets/images/scourse.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
          ),
          borderRadius: BorderRadius.all(Radius.circular(size.width * 0.03)),
        ));
  }
}
