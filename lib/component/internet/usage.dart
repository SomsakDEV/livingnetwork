import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/component/internet/usage_sub.dart';
import 'package:living_network/component/sale/sale_badge_widget.dart';
import 'package:living_network/utility/image_utils.dart';
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
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 10, top: 10),
                  child: Image.asset(
                    ImageUtils.getImagePath('assets/images/low_internet_usage.png'),
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
                        style: LNStyle.header6_1,
                      ),
                      const IUWidget(
                        maxValue: 100,
                        markerValue: 6,
                        barPointerEdgeStyle: LinearEdgeStyle.startCurve,
                        barColorGradient: [
                          LNColor.lowInternet1,
                          LNColor.lowInternet2,
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
                                  style: LNStyle.internetUsageLow,
                                ),
                                Text(
                                  ' remaining',
                                  style: LNStyle.caption2,
                                ),
                              ],
                            ),
                            const Text(
                              '50 GB',
                              style: LNStyle.caption2,
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
          SaleBadgeWidget()
        ],
      ),
    );
  }
}
