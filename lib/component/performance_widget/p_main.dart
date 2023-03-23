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
      if (key != "cellTower") {
        contentList.add(PerformanceModel(
          text: Text(
            getName(key),
            style: LNStyle.header6_1B,
          ),
          iconImage: ImageUtils.getImagePath('assets/images/${getIconImage(key)}'),
          qualityImage: ImageUtils.getImagePath('assets/images/${getQualityImage(value)}'),
        ));
      }
    });
    return contentList;
  }

  String getIconImage(String value) {
    switch (value) {
      case "social":
        return "performance_icon_1.png";
      case "live":
        return "performance_icon_2.png";
      case "videoStreaming":
        return "performance_icon_3.png";
      case "music":
        return "performance_icon_4.png";
      case "game":
        return "performance_icon_5.png";
      default:
        return "mode_Internet_bw.png";
    }
  }

  String getName(String value) {
    switch (value) {
      case "social":
        return "Browsing/Social";
      case "live":
        return "Live";
      case "videoStreaming":
        return "Video streaming";
      case "music":
        return "Music streaming";
      case "game":
        return "Game";
      default:
        return "Unknown";
    }
  }

  String getQualityImage(int value) {
    switch (value) {
      case 1:
        return "signal_excellent.png";
      case 2:
        return "signal_good.png";
      case 3:
        return "signal_fair.png";
      case 4:
        return "signal_poor.png";
      default:
        return "signal_unavailable.png";
    }
  }

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
