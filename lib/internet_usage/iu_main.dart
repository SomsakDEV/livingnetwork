import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:living_network/internet_usage/iu_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class InternetUsage extends StatefulWidget {
  const InternetUsage({super.key});

  @override
  State<InternetUsage> createState() => _InternetUsageState();
}

class _InternetUsageState extends State<InternetUsage> {
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
              child: Image.asset(
                'packages/living_network/assets/images/low_internet_usage.png',
                width: 44,
                height: 44,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Internet',
                    style: LNBaseTextStyle.header6_1,
                  ),
                  const IUWidget(
                    maxValue: 100,
                    markerValue: 6,
                    barPointerEdgeStyle: LinearEdgeStyle.startCurve,
                    barColorGradient: [
                      BaseColorsLN.lowInternet1,
                      BaseColorsLN.lowInternet2,
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            Text(
                              '4 GB',
                              style: LNBaseTextStyle.internetUsageLow,
                            ),
                            Text(
                              ' remaining',
                              style: LNBaseTextStyle.caption2,
                            ),
                          ],
                        ),
                        const Text(
                          '50 GB',
                          style: LNBaseTextStyle.caption2,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
