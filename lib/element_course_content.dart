import 'package:flutter/material.dart';
import 'package:zedni/screens/screens.dart';

class Element_Course_Content extends StatefulWidget {
  const Element_Course_Content({Key? key}) : super(key: key);
  static const screenRoute = 'Element_Course_Content';
  

  

  @override
  State<Element_Course_Content> createState() => Element_Course_ContentState();
}

class Element_Course_ContentState extends State<Element_Course_Content> {
  List details = [
    {
      "name": "النهايات",
      "unit": "الوحدة الأولى - الدرس الأول",
      "price": "السعر : 5000",
    },
    {
      "name": "المصفوفات",
      "unit": "الوحدة الثانية - الدرس الأول",
      "price": "السعر : 5000",
    },
    {
      "name": "التوابع",
      "unit": "الوحدة الثالثة - الدرس الأول",
      "price": "السعر : 5000",
    }
  ];
  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          child: ListView.builder(
              itemCount: details.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("Video_Player");

                  },
                  child: Container(
                    margin: EdgeInsets.all(size.width * 0.01),
                    color: lprimarycolor5,
                    height: size.height * 0.2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ListTile(
                          title: Text(
                            "${details[i]['name']}",
                            textDirection: TextDirection.rtl,
                          ),
                          subtitle: Text("${details[i]['unit']}",
                              textDirection: TextDirection.rtl),
                          leading: Text(
                            "${details[i]['price']}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: lprimarycolor2),
                          ),
                        ),
                       
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
