import 'package:flutter/material.dart';

import 'animated_ball.dart';
import 'ball.dart';
import 'horizontal_holder.dart';
import 'vertical_holder.dart';

class CustomProgressIndicator extends StatefulWidget {
  final double widgetHeight;
  final String message;

  const CustomProgressIndicator(
      {this.message = "جار التحميل...", required this.widgetHeight, Key? key})
      : super(key: key);

  @override
  State<CustomProgressIndicator> createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: -0.6, end: 0.6).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final holderThink = widget.widgetHeight / 15;
    return Container(
      margin: const EdgeInsets.all(20),
      height: widget.widgetHeight,
      width: widget.widgetHeight * 1.9 - 40,
      child: Column(
        children: [
          HorizontalHolder(height: holderThink),
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VerticalHolder(width: holderThink),
                const Spacer(),
                AnimatedBall(
                  clockwise: false,
                  animation: _animation,
                ),
                const ConstBall(),
                const ConstBall(),
                const ConstBall(),
                AnimatedBall(
                  clockwise: true,
                  animation: _animation,
                ),
                const Spacer(),
                VerticalHolder(width: holderThink),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              widget.message,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
