import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String iconPath;
  final String primaryMessage;
  final String secondaryMessage;
  final VoidCallback? retryFun;

  const CustomErrorWidget({
    super.key,
    this.iconPath = "assets/icons/empty_box.svg",
    this.primaryMessage = "لا يوجد منتجات لعرضها ",
    this.secondaryMessage = "",
    this.retryFun,
  });
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SvgPicture.asset(
        //   iconPath,
        //   width: 75,
        //   placeholderBuilder: (_)=>const Icon(Icons.error_outline,size: 35,),
        // ),
        const SizedBox(height: 16),
        Text(
          primaryMessage,
          style: const TextStyle(
            color: Colors.redAccent,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          secondaryMessage,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        if(retryFun !=null)
        IconButton(onPressed: retryFun, icon: const Icon(Icons.refresh))
      ],
    ),
  );
}
