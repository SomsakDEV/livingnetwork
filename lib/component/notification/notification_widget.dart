import 'package:flutter/material.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/constance/constants.dart';
import 'package:living_network/utility/image_utils.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  String mode = 'Mode5G';

  @override
  Widget build(BuildContext context) {
    return mode == 'Mode5G' ? mode5G() : liveModeExpired();
  }

  Card mode5G() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, bottom: 8, right: 7),
                child: Image.asset(
                  ImageUtils.getImagePath('assets/images/myais.png'),
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 0, bottom: 11, right: 261),
                child: Text(
                  'myAIS',
                  style: LNStyle.notificationMyAIS,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 4, right: 12, left: 12),
                  child: Text(
                    notificationTitleMode5G,
                    style: LNStyle.notificationTitle,
                  )),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 12, left: 12),
                  child: Text(
                    notificationSubTitleMode5G,
                    style: LNStyle.notificationSubTitle,
                  )),
            ],
          ),
        ],
      ),
    );
  }

  Card liveModeExpired() {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 10, bottom: 8, right: 7),
                child: Image.asset(
                  ImageUtils.getImagePath('assets/images/myais.png'),
                  width: 20,
                  height: 20,
                  fit: BoxFit.cover,
                ),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(top: 10, left: 0, bottom: 11, right: 261),
                child: Text(
                  'myAIS',
                  style: LNStyle.notificationMyAIS,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(
                      top: 0, bottom: 4, right: 12, left: 12),
                  child: Text(
                    notificationTitleLiveModeExpired,
                    style: LNStyle.notificationTitle,
                  )),
            ],
          ),
          Row(
            children: [
              Padding(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 12, left: 12),
                  child: Text(
                    notificationSubTitleLiveModeExpired,
                    style: LNStyle.notificationSubTitle,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
