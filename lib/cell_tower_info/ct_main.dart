import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/base_color_text/base_text_style.dart';

class CellTowerInfoMain extends StatefulWidget {
  const CellTowerInfoMain({super.key});

  @override
  State<CellTowerInfoMain> createState() => _CellTowerInfoMainState();
}

class _CellTowerInfoMainState extends State<CellTowerInfoMain> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: BaseColorsLN.lightestGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0, right: 16),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 15),
              child: Image.asset(
                'packages/living_network/assets/images/cell_tower_1.png',
                width: 30,
                height: 30,
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
                          style: LNBaseTextStyle.header6_1B,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Image.asset(
                            'packages/living_network/assets/images/signal_Fair.png',
                            width: 68,
                            height: 18,
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Near Wat Yai Chai Mongkhon, Ayutthaya',
                      style: LNBaseTextStyle.body3,
                    )
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
