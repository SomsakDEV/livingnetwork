import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/base_color_text/base_text_style.dart';

class SaleBadgeMain extends StatefulWidget {
  const SaleBadgeMain({super.key});

  @override
  State<SaleBadgeMain> createState() => _SaleBadgeMainState();
}

class _SaleBadgeMainState extends State<SaleBadgeMain> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: BaseColorsLN.primaryColor100,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: BaseColorsLN.lightestGrey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset(
                'packages/living_network/assets/images/sale_badge.png',
                width: 44,
                height: 44,
              ),
            ),
            Column(
              children: [
                const Text(
                  'พิเศษ! แพ็กเสริมเน็ต 30 GB 7 วัน',
                  style: LNBaseTextStyle.header6_1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
