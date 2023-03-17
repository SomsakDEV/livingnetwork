import 'package:flutter/material.dart';
import 'package:living_network/constance/LNstyle.dart';
import 'package:living_network/component/performance_widget/p_card_content_widget.dart';
import 'package:living_network/component/performance_widget/p_example_model.dart';
import 'package:living_network/component/performance_widget/p_expansion_widget.dart';
import 'package:living_network/component/performance_widget/ui_bottomsheet.dart';
import 'package:living_network/constance/constants.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:provider/provider.dart';

class PerformanceMain extends StatefulWidget {
  const PerformanceMain({super.key});

  @override
  State<PerformanceMain> createState() => _PerformanceMainState();
}

class _PerformanceMainState extends State<PerformanceMain> {
  List<PerformanceModel> createContentList(Perform? perform) {
    List<PerformanceModel> contentList = [];
    perform?.toJson().forEach((key, value) {
      contentList.add(PerformanceModel(
        text: Text(
          getName(key),
          style: LNStyle.header6_1B,
        ),
        iconImage: ImageUtils.getImagePath('assets/images/${getIconImage(key)}'),
        qualityImage: ImageUtils.getImagePath('assets/images/${getQualityImage(value)}'),
      ));
    });
    return contentList;
  }

  String getIconImage(String value) {
    String iconImage;
    switch (value) {
      case "social":
        return iconImage = "performance_icon_1.png";
      case "live":
        return iconImage = "performance_icon_2.png";
      case "videoStreaming":
        return iconImage = "performance_icon_3.png";
      case "music":
        return iconImage = "performance_icon_4.png";
      case "game":
        return iconImage = "performance_icon_5.png";
      default:
        return iconImage = "mode_Internet_bw.png";
    }
  }

  String getName(String value) {
    String name;
    switch (value) {
      case "social":
        return name = "Browsing/Social";
      case "live":
        return name = "Live";
      case "videoStreaming":
        return name = "Video streaming";
      case "music":
        return name = "Music streaming";
      case "game":
        return name = "Game";
      default:
        return name = "Unknown";
    }
  }

  String getQualityImage(int value) {
    String qualityImage;
    switch (value) {
      case 1:
        return qualityImage = "signal_excellent.png";
      case 2:
        return qualityImage = "signal_good.png";
      case 3:
        return qualityImage = "signal_fair.png";
      case 4:
        return qualityImage = "signal_poor.png";
      default:
        return qualityImage = "signal_unavailable.png";
    }
  }

  // List<PerformanceModel> contentList = [
  //   PerformanceModel(
  //     text: const Text(
  //       'Browsing/Social',
  //       style: LNStyle.header6_1B,
  //     ),
  //     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_1.png'),
  //     qualityImage: ImageUtils.getImagePath('assets/images/signal_excellent.png'),
  //   ),
  //   PerformanceModel(
  //     text: const Text(
  //       'Live',
  //       style: LNStyle.header6_1B,
  //     ),
  //     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_2.png'),
  //     qualityImage: ImageUtils.getImagePath('assets/images/signal_excellent.png'),
  //   ),
  //   PerformanceModel(
  //     text: const Text(
  //       'Video streaming',
  //       style: LNStyle.header6_1B,
  //     ),
  //     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_3.png'),
  //     qualityImage: ImageUtils.getImagePath('assets/images/signal_excellent.png'),
  //   ),
  //   PerformanceModel(
  //     text: const Text(
  //       'Music streaming',
  //       style: LNStyle.header6_1B,
  //     ),
  //     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_4.png'),
  //     qualityImage: ImageUtils.getImagePath('assets/images/signal_good.png'),
  //   ),
  //   PerformanceModel(
  //     text: const Text(
  //       'Game',
  //       style: LNStyle.header6_1B,
  //     ),
  //     iconImage: ImageUtils.getImagePath('assets/images/performance_icon_5.png'),
  //     qualityImage: ImageUtils.getImagePath('assets/images/signal_fair.png'),
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Consumer<LnProvider>(
      builder: (context, data, _) => Card(
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
                              contentList: createContentList(data.perform),
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
                                style: LNStyle.modeWidgetTitle,
                              ),
                              IconButton(
                                icon: Image.asset(
                                  ImageUtils.getImagePath('assets/images/exclamation_green2.png'),
                                  height: 13.33,
                                  width: 13.33,
                                ),
                                padding: const EdgeInsets.only(left: 5.33),
                                alignment: Alignment.centerLeft,
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
                            style: LNStyle.caption_1,
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
      ),
    );
  }
}
