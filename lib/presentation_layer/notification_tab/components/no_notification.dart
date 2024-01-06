import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zidne/core/assets.dart';

class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          AppAssets.notify,
          height:200,
          width: 200,
        ),
        const SizedBox(height: 16),
        const Text(
          "لا يوجد لديك إشعارات",
          style: TextStyle(
            color: Colors.redAccent,
            fontSize: 22,
          ),
        ),
      ],
    );
  }
}
