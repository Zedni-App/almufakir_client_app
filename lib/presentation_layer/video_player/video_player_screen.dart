import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'components/control_panel.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen(
      {super.key, required this.videoPath, required this.fromLocal});

  final String videoPath;
  final bool fromLocal;

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late final VideoPlayerController controller;
  bool ready = false;
  bool failedInit = false;

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ready
          ? Stack(
              alignment: Alignment.bottomCenter,
              children: [
                VideoPlayer(controller),
                ControlPanel(controller),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  void initPlayer() async {
    try {
      controller = widget.fromLocal
          ? VideoPlayerController.file(File(widget.videoPath))
          : VideoPlayerController.networkUrl(Uri.parse(widget.videoPath));
      await controller.initialize();
      if (controller.value.isInitialized) {
        setState(() => ready = true);
        controller.play();
      } else {
        setState(() => failedInit = true);
      }
    } on Exception catch (_) {
      setState(() => failedInit = true);
    }
  }
}
