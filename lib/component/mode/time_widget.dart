import 'dart:async';
import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';

class TimeWidget extends StatefulWidget {
  // final Duration countDownTime;
  final DateTime? expire;
  final TextStyle? textStyle;
  final bool isFreeTrial;
  final bool? check;
  final Function? setMode;

  // final String title;
  const TimeWidget({
    super.key,
    // required this.countDownTime,
    this.setMode,
    this.expire,
    this.textStyle,
    this.isFreeTrial = true,
    this.check,
  });

  @override
  State<TimeWidget> createState() => _TimeWidgetState();
}

class _TimeWidgetState extends State<TimeWidget> {
  Duration duration = const Duration();
  Timer? timer;
  bool checkTimerStart = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void startTimer(InternalProvider data) {
    if (widget.expire != null) {
      if (checkTimerStart) {
        DateTime expireTime =
            widget.expire ?? DateTime.now().add(const Duration(seconds: -10));
        int seconds = expireTime.difference(DateTime.now()).inSeconds;
        if (seconds > 0) {
          duration = Duration(seconds: seconds <= 0 ? 0 : seconds);
          timer = Timer.periodic(
              const Duration(seconds: 1),
              (_) => setState(
                    () {
                      timeState(data);
                    },
                  ));
          checkTimerStart = false;
        }
      } else if (checkTimerStart) {
        duration = const Duration(seconds: -2);
      }
    }
  }

  timeState(InternalProvider data) {
    final seconds = duration.inSeconds - 1;
    if (seconds <= 0 || !(widget.check ?? true)) {
      if (widget.check ?? true) {
        widget.setMode!(data);
      }
      checkTimerStart = true;
      duration = const Duration(seconds: 0, hours: 0, minutes: 0);
      timer?.cancel();
    } else {
      duration = Duration(seconds: seconds);
    }
  }

  buildTime() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inSeconds < -1 || widget.expire == null) {
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
                    colors: [LNColor.greenColor10, LNColor.greenColor20])),
            height: 24,
            child: Row(
              children: [
                const SizedBox(
                  width: 4.33,
                ),
                Image.asset(
                  ImageUtils.getImagePath('assets/images/mode_vector.png'),
                  width: 11.44,
                  height: 13,
                ),
                const SizedBox(
                  width: 4.23,
                ),
                Text(
                  '$hours : $minutes : $seconds',
                  style: widget.textStyle ?? LNStyle.timeWidgetNumber,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 4,
                ),
              ],
            ),
          ),
        );
      } else {
        return Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: LNColor.neutralsLightGrey),
            // width: MediaQuery.of(context).size.width * 0.95,
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
                          color: LNColor.textColorTabBar),
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
                              color: LNColor.greyBlue,
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
    return Consumer<InternalProvider>(builder: (context, data, _) {
      startTimer(data);
      return buildTime();
    });
  }
}
