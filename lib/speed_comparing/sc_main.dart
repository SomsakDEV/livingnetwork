import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/speed_comparing/sc_widget.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedComparingMain extends StatefulWidget {
  const SpeedComparingMain({super.key});

  @override
  State<SpeedComparingMain> createState() => _SpeedComparingMainState();
}

class _SpeedComparingMainState extends State<SpeedComparingMain> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: BaseColorsLN.lightestGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Speed Comparing',
                  style: LNBaseTextStyle.header6_1,
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              'ค่าเฉลี่ยความเร็ว speed บริเวณที่คุณอยู่ตอนนี้',
              style: LNBaseTextStyle.caption,
            ),
            SCWidget(
              labelText: '5G Speed',
              markerPointers: [
                LinearWidgetPointer(
                  value: 80,
                  position: LinearElementPosition.cross,
                  child: Image.asset(
                    'packages/living_network/assets/images/5G_icon.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
              maxValue: 100,
              markerValue: 80,
            ),
            SCWidget(
              labelText: 'Your Package Speed',
              textColor: BaseColorsLN.textColorTabbar,
              maxValue: 100,
              markerValue: 20,
              markerPointers: [
                LinearWidgetPointer(
                  value: 20,
                  position: LinearElementPosition.cross,
                  child: Image.asset(
                    'packages/living_network/assets/images/4G_icon.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
