import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar(this.controller, {super.key});

  final VideoPlayerController controller;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Column(
        children: [
          VideoProgressIndicator(
            widget.controller,
            allowScrubbing: true,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formTime(widget.controller.value.position),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                formTime(widget.controller.value.duration),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  formTime(Duration time) {
    final h = time.inHours;
    final m = time.inMinutes - (h * 60);
    final s = time.inSeconds - (time.inMinutes * 60);
    final moreThanHour = h != 0;
    return moreThanHour ? "$h:$m:$s" : "$m:$s";
  }
}
