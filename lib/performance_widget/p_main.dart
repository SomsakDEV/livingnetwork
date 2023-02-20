import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:living_network/performance_widget/p_card_content_widget.dart';
import 'package:living_network/performance_widget/p_example_model.dart';
import 'package:living_network/performance_widget/p_expansion_widget.dart';

class PerformanceMain extends StatefulWidget {
  const PerformanceMain({super.key});

  @override
  State<PerformanceMain> createState() => _PerformanceMainState();
}

class _PerformanceMainState extends State<PerformanceMain> {
  List<PerformanceModel> contentList = [
    PerformanceModel(
      text: const Text(
        'Browsing/Social',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_1.png',
      qualityImage: 'packages/living_network/assets/images/signal_excellent.png',
    ),
    PerformanceModel(
      text: const Text(
        'Live',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_2.png',
      qualityImage: 'packages/living_network/assets/images/signal_excellent.png',
    ),
    PerformanceModel(
      text: const Text(
        'Video streaming',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_3.png',
      qualityImage: 'packages/living_network/assets/images/signal_excellent.png',
    ),
    PerformanceModel(
      text: const Text(
        'Music streaming',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_4.png',
      qualityImage: 'packages/living_network/assets/images/signal_Good.png',
    ),
    PerformanceModel(
      text: const Text(
        'Game',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_5.png',
      qualityImage: 'packages/living_network/assets/images/signal_Fair.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: BaseColorsLN.lightestGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.85,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    CustomExpansionTile(
                      backgroundColor: Colors.transparent,
                      collapsedBackgroundColor: Colors.transparent,
                      children: [
                        CardContentWidget(
                          contentList: contentList,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Performance',
                              style: LNBaseTextStyle.header6_1B,
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.info_outline,
                                size: 16,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        Text(
                          'Updated 1 min ago',
                          style: LNBaseTextStyle.caption_1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
