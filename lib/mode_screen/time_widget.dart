import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_style/base_color.dart';

class TimeWidget extends StatefulWidget {
  // final Duration countDownTime;
  final DateTime? expire;
  final TextStyle? textStyle;
  // final String title;
  const TimeWidget({
    super.key,
    // required this.countDownTime,
    this.expire,
    this.textStyle,
  });
  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  DateTime currentTime = DateTime.now();
  Duration duration = const Duration();
  Timer? timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() {
    DateTime expireTime = widget.expire ?? DateTime.now();
    int seconds = expireTime.difference(currentTime).inSeconds;
    duration = Duration(seconds: seconds <= 0 ? 0 : seconds);
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (_) => setState(
              () {
                final seconds = duration.inSeconds - 1;
                if (seconds < 0) {
                  timer?.cancel();
                } else {
                  duration = Duration(seconds: seconds);
                }
              },
            ));
  }

  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (hours != '00' && minutes != '00' && seconds != '00') {
      return Text(
        '$hours : $minutes : $seconds',
        style: widget.textStyle ??
            const TextStyle(
                fontWeight: FontWeight.w700,
                color: BaseColors.whiteColor,
                fontSize: 14),
      );
    } else {
      return const SizedBox();
    }
  }

  @override
  void dispose() {
    // buildTime().dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildTime();
  }
}
