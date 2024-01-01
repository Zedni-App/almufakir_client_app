import 'package:flutter/material.dart';

class ConstBall extends StatelessWidget {
  const ConstBall({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 2,
            color: Colors.grey,
          ),
        ),
        Container(
          height: 35,
          width: 35,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                Colors.black12,
                Colors.black54,
                Colors.black,
              ],
              center: Alignment.topCenter,
              stops: [0, 0.6, 1],
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
