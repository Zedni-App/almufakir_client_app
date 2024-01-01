import 'package:flutter/material.dart';

import 'core/app_styles/theme.dart';

class ElementCourseContent extends StatefulWidget {
  const ElementCourseContent({Key? key}) : super(key: key);
  static const screenRoute = 'Element_Course_Content';

  @override
  State<ElementCourseContent> createState() => ElementCourseContentState();
}

class ElementCourseContentState extends State<ElementCourseContent> {
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
      body: ListView.builder(
          itemCount: details.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed("Video_Player");
              },
              child: Container(
                margin: EdgeInsets.all(size.width * 0.01),
                color: AppColors.lprimarycolor5,
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
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: AppColors.kPrimaryColor),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
