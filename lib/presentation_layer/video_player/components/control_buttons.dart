import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../data_layer/shared_preferences.dart';
import '../../../core/app_styles/app_theme.dart';
import '../../../core/utilities/navigators.dart';

class ControlButtons extends StatelessWidget {
  ControlButtons(this.controller, {super.key});

  final VideoPlayerController controller;

  final videoMoveValue = AppSp.getInt(SPVars.videoMoveValue) ?? 10;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () async => pagePop(),
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.lPrimaryColor,
            size: 40,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () async {
            await controller.seekTo(Duration(
              seconds: controller.value.position.inSeconds + videoMoveValue,
            ));
          },
          icon: const Icon(
            Icons.fast_forward,
            color: AppColors.lPrimaryColor,
            size: 40,
          ),
        ),
        StatefulBuilder(builder: (context, update) {
          return IconButton(
            onPressed: () async {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
              update(() {});
            },
            icon: Icon(
              controller.value.isPlaying ? Icons.pause : Icons.play_circle_fill,
              color: AppColors.lPrimaryColor,
              size: 40,
            ),
          );
        }),
        IconButton(
          onPressed: () async {
            await controller.seekTo(Duration(
                seconds: controller.value.position.inSeconds - videoMoveValue));
          },
          icon: const Icon(
            Icons.fast_rewind,
            color: AppColors.lPrimaryColor,
            size: 40,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
