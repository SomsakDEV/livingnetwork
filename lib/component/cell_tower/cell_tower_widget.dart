import 'package:flutter/material.dart';
import 'package:living_network/constance/LNstyle.dart';
import 'package:living_network/utility/image_utils.dart';


class CellTowerWidget extends StatefulWidget {
  const CellTowerWidget({super.key});

  @override
  State<CellTowerWidget> createState() => _CellTowerWidgetState();
}

class _CellTowerWidgetState extends State<CellTowerWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
