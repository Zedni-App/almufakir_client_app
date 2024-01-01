import 'package:warsha_management/utils/constant.dart';
import 'package:flutter/material.dart';
import '../my_circle_avatar.dart';

class NotificationItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  final String fromImage;

  const NotificationItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
    required this.fromImage,
  }) : super(key: key);

  @override
  State<NotificationItem> createState() => _NotificationItemState();
}

class _NotificationItemState extends State<NotificationItem> {
  late bool isSelected= false;

  @override
  void initState() {
    isSelected =false;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1500),
      padding:const EdgeInsets.all(8),
      margin:const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black12,

      ),
      child: Column(
        children: [
          ListTile(
            leading: const MyCircleAvatar(
              width: 32,
              image: Constant.avatarImageTestUrl,

            ),
            title: Text(
              widget.title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              widget.subTitle,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black38,
                fontSize: 14,
              ),
            ),
            trailing: InkWell(
              onTap:()=> setState(() {
                isSelected = !isSelected;
              }),
              child: CircleAvatar(
                radius: 16,
                backgroundColor: Colors.black12,
                child: Icon(!isSelected?Icons.keyboard_arrow_down:Icons.keyboard_arrow_up,size: 28,color: Colors.black54,),
              ),
            ),
          ),
          if(isSelected)
          Image.network(Constant.carIconTestUrl ,height: 150, )


        ],
      ),
    );
  }
}
