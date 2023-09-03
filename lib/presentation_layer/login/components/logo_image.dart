
import 'package:flutter/material.dart';

import '../../../core/app_styles/size_config.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: percentWidth(0.5),
        height: percentHeight(0.35),
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}