import 'package:flutter/material.dart';
import 'package:zedni/screens/screens.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vector_graphics/vector_graphics.dart';

class MainInterface extends StatefulWidget {
  const MainInterface({Key? key}) : super(key: key);

  @override
  State<MainInterface> createState() => _MainInterfaceState();
}

class _MainInterfaceState extends State<MainInterface> {
  String component1 = "بكلوريا علمي";
  String component2 = "بكلوريا أدبي";
  String component3 = "تاسع";
  String component4 = "مراجعة سريعة";

  String component5 = "المتفوقين";
  String component6 = "حفظة القرآن الكريم";
  String component7 = "ذوي الهمم";
  String component8 = "الإخوة";

  String component9 = "متابعة الطالب";
  String component10 = "تواصل مع الأهل";
  String component11 = "جوائز تحفيزية";
  String component12 = "أذكار و أدعية";
  String component13 = "جدول دراسي";
  String component14 = "تذكيرات";

  String elmi = "assets/images/elmi.png";
  String adbi = "assets/images/adbi.png";
  String nine = "assets/images/9.png";
  String ret = "assets/images/ret.png";
  String azkar = "assets/images/azkar.png";
  String bro = "assets/images/bro.png";
  String connect = "assets/images/connect.png";
  String disa = "assets/images/disa.png";
  String gift = "assets/images/gift.png";
  String medal = "assets/images/medal.png";
  String quran = "assets/images/quran.png";
  String rate = "assets/images/rate.png";
  String reminder = "assets/images/reminder.png";
  String steper = "assets/images/steper.png";
  String timeline = "assets/images/timeline.png";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          width: double.infinity,
          height: size.height * 0.03,
          color: lprimarycolor1.withOpacity(0.7),
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.2,
          color: lprimarycolor5.withOpacity(0.7),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  height: size.height * 0.3,
                  child: Container(
                      margin: EdgeInsets.all(size.width * 0.025),
                      child: Image.asset("assets/images/logo.png")),
                ),
                const Text(
                  "مرحباً بك\nفي تطبيق المفكر",
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: lprimarycolor1),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: size.height * 0.04,
          color: lprimarycolor1.withOpacity(0.7),
        ),
        SizedBox(height: size.height * 0.03),
        // Container(
        //   child: CarouselSlider(
        //       options: CarouselOptions(
        //         height: size.height * 0.40,
        //         autoPlay: true,
        //         autoPlayAnimationDuration: const Duration(
        //           seconds: 1,
        //         ),
        //       ),
        //       items: [
        //         Image.asset("assets/images/intro7.jpg"),
        //         Image.asset("assets/images/intro5.jpg"),
        //         Image.asset("assets/images/intro3.jpg"),
        //       ]),
        // ),
        SizedBox(height: size.height * 0.03),
        //الكورسات
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("Courses");
          },
          child: Container(
            width: size.width * 0.40,
            height: size.height * 0.09,
            decoration: BoxDecoration(
                color: lprimarycolor2.withOpacity(0.8),
                borderRadius: BorderRadius.circular(size.height * 0.004)),
            child: Center(
              child: Text(
                "الكورسات",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.03),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          margin: EdgeInsets.all(size.height * 0.03),
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: size.width * 0.04,
            crossAxisSpacing: size.width * 0.04,
            children: [
              componentInterface(component1, elmi),
              componentInterface(component2, adbi),
              componentInterface(component3, nine),
              componentInterface(component4, ret),
            ],
          ),
        ),
        SizedBox(height: size.height * 0.03),
        //الحسومات
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("Sold");
          },
          child: Container(
            width: size.width * 0.40,
            height: size.height * 0.09,
            decoration: BoxDecoration(
                color: lprimarycolor2.withOpacity(0.8),
                borderRadius: BorderRadius.circular(size.height * 0.004)),
            child: Center(
              child: Text(
                "الحسومات",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.03),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          margin: EdgeInsets.all(size.height * 0.03),
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: size.width * 0.04,
            crossAxisSpacing: size.width * 0.04,
            children: [
              componentInterface(component5, rate),
              componentInterface(component6, quran),
              componentInterface(component7, disa),
              componentInterface(component8, bro),
            ],
          ),
        ),
        //الميزات
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed("Advantages");
          },
          child: Container(
            width: size.width * 0.40,
            height: size.height * 0.09,
            decoration: BoxDecoration(
                color: lprimarycolor2.withOpacity(0.8),
                borderRadius: BorderRadius.circular(size.height * 0.004)),
            child: Center(
              child: Text(
                "الميزات",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: size.height * 0.03),
              ),
            ),
          ),
        ),
        SizedBox(height: size.height * 0.03),
        Container(
          margin: EdgeInsets.all(size.height * 0.03),
          child: GridView.count(
            childAspectRatio: (itemWidth / itemHeight),
            shrinkWrap: true,
            crossAxisCount: 2,
            mainAxisSpacing: size.width * 0.04,
            crossAxisSpacing: size.width * 0.04,
            children: [
              componentInterface(component9, steper),
              componentInterface(component10, connect),
              componentInterface(component11, gift),
              componentInterface(component12, azkar),
              componentInterface(component13, timeline),
              componentInterface(component14, reminder),
            ],
          ),
        )
      ])),
    );
  }

  Widget componentInterface(String componame, String imgname) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Container(
        child: Column(
          children: [
            Container(width: 170, height: 170, child: Image.asset(imgname)),
            SizedBox(
              height: size.height * 0.01,
            ),
            Container(
              decoration: BoxDecoration(
                  color: lprimarycolor2.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(size.height * 0.003)),
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01, horizontal: size.width * 0.03),
              child: Text(
                componame,
                style: TextStyle(
                    color: lprimarycolor1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );

    // return Container(
    //     child: Center(
    //   child: Text(
    //     componame,
    //     style: TextStyle(
    //         color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
    //   ),
    // ),
    //     width: size.width * 0.8,
    //     height: size.height * 0.8,
    //     decoration: BoxDecoration(
    //       border: Border.all(color: lprimarycolor2, width: 3),
    //       image: DecorationImage(
    //         image: AssetImage("assets/images/elmi.png"),
    //         fit: BoxFit.cover,
    //         colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
    //       ),
    //       borderRadius: BorderRadius.all(Radius.circular(size.width * 0.03)),
    //     ));
  }
}
