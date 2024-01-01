import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'control_buttons.dart';
import 'progress_bar.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel(this.controller, {super.key});
  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      color: Colors.white70,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ProgressBar(controller),
          ControlButtons(controller),
        ],
      ),
    );
  }
}
