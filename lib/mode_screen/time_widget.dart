import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ui_style/base_color.dart';

//
class TimeWidget extends StatefulWidget {
  // final Duration countDownTime;
  final DateTime expire;

  // final String title;

  const TimeWidget({
    super.key,
    // required this.countDownTime,
    required this.expire,
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
    DateTime expireTime = widget.expire;
    duration = Duration(seconds: expireTime.difference(currentTime).inSeconds);
    startTimer();
  }

  void setStateIfMounted() {
    if (mounted) {
      setState(
        () {
          final seconds = duration.inSeconds - 1;
          if (seconds < 0) {
            timer?.cancel();
          } else {
            duration = Duration(seconds: seconds);
          }
        },
      );
    }
  }

  startTimer() {
    timer =
        Timer.periodic(const Duration(seconds: 1), (_) => setStateIfMounted());
  }

  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return Text(
      '$hours:$minutes:$seconds',
      style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: BaseColors.neutralsBlack,
          fontSize: 14),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildTime();
  }
}
