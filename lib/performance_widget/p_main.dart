import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:living_network/performance_widget/p_card_content_widget.dart';
import 'package:living_network/performance_widget/p_example_model.dart';
import 'package:living_network/performance_widget/p_expansion_widget.dart';
import 'package:living_network/performance_widget/ui_bottomsheet.dart';
import 'package:living_network/utils/constants.dart';

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
      qualityImage:
          'packages/living_network/assets/images/signal_excellent.png',
    ),
    PerformanceModel(
      text: const Text(
        'Live',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_2.png',
      qualityImage:
          'packages/living_network/assets/images/signal_excellent.png',
    ),
    PerformanceModel(
      text: const Text(
        'Video streaming',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_3.png',
      qualityImage:
          'packages/living_network/assets/images/signal_excellent.png',
    ),
    PerformanceModel(
      text: const Text(
        'Music streaming',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_4.png',
      qualityImage: 'packages/living_network/assets/images/signal_good.png',
    ),
    PerformanceModel(
      text: const Text(
        'Game',
        style: LNBaseTextStyle.header6_1B,
      ),
      iconImage: 'packages/living_network/assets/images/performance_icon_5.png',
      qualityImage: 'packages/living_network/assets/images/signal_fair.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
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
                  fit: StackFit.passthrough,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      child: CustomExpansionTile(
                        backgroundColor: Colors.transparent,
                        collapsedBackgroundColor: Colors.transparent,
                        children: [
                          CardContentWidget(
                            contentList: contentList,
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          children: [
                            const Text(
                              'Performance',
                              style: LNBaseTextStyle.header6_1B,
                            ),
                            IconButton(
                              icon: Image.asset(
                                'packages/living_network/assets/images/information.png',
                                height: 13.33,
                                width: 13.33,
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return UiBottomSheetCardDialogTextMode(
                                      title: title_preformance,
                                      subTitle: subTitle_preformance,
                                      image: image_preformance,
                                    );
                                    
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        const Text(
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
