import 'package:flutter/material.dart';
import 'ball.dart';

class AnimatedBall extends AnimatedWidget {
  final bool clockwise;

  const AnimatedBall({
    Key? key,
    required this.clockwise,
    required Animation<double> animation,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    return Transform.rotate(
      alignment: Alignment.topCenter,
      angle: (clockwise && animation.value > 0) ||
              (!clockwise && animation.value < 0)
          ? animation.value
          : 0,
      child: const ConstBall(),
    );
  }
}
