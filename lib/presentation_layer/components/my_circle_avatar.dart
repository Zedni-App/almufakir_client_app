import 'package:flutter/material.dart';
import 'package:warsha_management/utils/constant.dart';

class MyCircleAvatar extends StatelessWidget {
  final double? width;
  final String? image;
  final Color? borderColor;
  final Color? backgroundColor;
  final double? borderSize;
  final EdgeInsets? padding;
  const MyCircleAvatar({Key? key, this.width, required this.image, this.borderColor, this.backgroundColor, this.borderSize, this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:padding?? const EdgeInsets.all(0),
      child: CircleAvatar(
        radius: width??20,
        backgroundColor:borderColor?? Colors.orangeAccent,
        child: CircleAvatar(
          radius: (width??20)  - (borderSize??2),
          backgroundColor: backgroundColor?? Colors.grey,
          foregroundColor:backgroundColor?? Colors.grey ,
          backgroundImage: NetworkImage(image??Constant.avatarImageTestUrl ),

        ),
      ),
    );
  }
}
