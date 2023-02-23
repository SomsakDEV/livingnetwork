import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ui_style/base_color.dart';

class TimeWidget extends StatefulWidget {
  // final Duration countDownTime;
  final DateTime? expire;
  final TextStyle? textStyle;
  final bool isFreeTrial;
  // final String title;
  const TimeWidget({
    super.key,
    // required this.countDownTime,
    this.expire,
    this.textStyle,
    this.isFreeTrial = true,
  });
  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  Duration duration = const Duration();
  Timer? timer;
  @override
  void initState() {
    super.initState();
  }

  startTimer() {
    DateTime expireTime =
        widget.expire ?? DateTime.now().add(const Duration(seconds: -10));
    int seconds = expireTime.difference(DateTime.now()).inSeconds;
    print(seconds);
    if (seconds > 0) {
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
    }else{
      timer?.cancel();
      duration = const Duration(seconds: 0);
    }
  }

  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (hours == '00' && minutes == '00' && seconds == '00') {
      return const SizedBox();
    } else {
      if (!widget.isFreeTrial) {
        return Align(
          alignment: Alignment.topRight,
          child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                      begin: FractionalOffset.centerLeft,
                      end: FractionalOffset.centerRight,
                      colors: [Color(0xFF9EDE3E), Color(0xFF64CA00)])),
              width: 68,
              height: 24,
              child: Row(children: [
                const SizedBox(
                  width: 4.33,
                ),
                Image.asset(
                  'packages/living_network/assets/images/mode_vector.png',
                  width: 11.44,
                  height: 13,
                ),
                const SizedBox(
                  width: 4.23,
                ),
                Text(
                  '$hours : $minutes : $seconds',
                  style: widget.textStyle ??
                      const TextStyle(
                          fontWeight: FontWeight.w700,
                          color: BaseColors.whiteColor,
                          fontSize: 14),
                )
              ])),
        );
      } else {
        return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Color(0xFFF2F4F6)),
            width: MediaQuery.of(context).size.width * 0.95,
            height: 54,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      'Free trial will expire:',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: BaseColors.textColorTabbar),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      '$hours : $minutes : $seconds',
                      textAlign: TextAlign.right,
                      style: widget.textStyle ??
                          const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: BaseColors.greyBlue,
                              fontSize: 22),
                    ),
                  ),
                ]));
      }
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
    startTimer();
    return buildTime();
  }
}
