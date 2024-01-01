import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Sold extends StatefulWidget {
  const Sold({Key? key}) : super(key: key);

  @override
  State<Sold> createState() => _SoldState();
}

class _SoldState extends State<Sold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Sold")));
  }
}
