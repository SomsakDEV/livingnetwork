import 'package:flutter/material.dart';
import 'package:living_network/constance/LNstyle.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';

class CellTowerWidget extends StatefulWidget {
  const CellTowerWidget({super.key});

  @override
  State<CellTowerWidget> createState() => _CellTowerWidgetState();
}

class _CellTowerWidgetState extends State<CellTowerWidget> {
  List<String> getQualityImage(int value) {
    List<String> qualityImage;
    switch (value) {
      case 1:
        return qualityImage = ["cell_tower_1.png", "signal_excellent"];
      case 2:
        return qualityImage = ["cell_tower_2.png", "signal_good"];
      case 3:
        return qualityImage = ["cell_tower_3.png", "signal_fair"];
      case 4:
        return qualityImage = ["cell_tower_4.png", "signal_weak"];
      case 5:
        return qualityImage = ["cell_tower_5.png", "signal_poor"];
      default:
        return qualityImage = ["cell_tower_6.png", "signal_unavailable"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LnProvider>(
      builder: (context, value, child) => Card(
        shadowColor: Colors.transparent,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 19, right: 20, top: 12, bottom: 12),
              child: Image.asset(
                ImageUtils.getImagePath('assets/images/cell_tower_1.png'),
                width: 26,
                height: 24,
              ),
            ),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'AIS 4G',
                          style: LNStyle.header6_1B,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, right: 16, top: 15),
                          child: Image.asset(
                            ImageUtils.getImagePath('assets/images/signal_fair.png'),
                            width: 68,
                            height: 18,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
