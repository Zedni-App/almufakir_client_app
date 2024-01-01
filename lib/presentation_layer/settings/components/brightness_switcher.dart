import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrightnessSwitcher extends StatelessWidget {
  const BrightnessSwitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 400),
        switchInCurve: Curves.linear,
        transitionBuilder: (child, animation) {
          return RotationTransition(
            turns: animation,
            child: child,
          );
        },
        child: Theme.of(context).brightness == Brightness.light
            ? const Icon(
                CupertinoIcons.moon_stars_fill,
                key: Key("night"),
                color: Colors.black54,
                size: 30,
              )
            : const Icon(
                CupertinoIcons.sun_min_fill,
                key: Key("day"),
                color: Colors.yellowAccent,
                size: 30,
              ),
      );
}
