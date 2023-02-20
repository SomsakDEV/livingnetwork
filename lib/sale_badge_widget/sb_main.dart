import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:ui_style/ui_style.dart';

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
        padding: const EdgeInsets.all(10.0),
        child: Row(
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
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'พิเศษ! แพ็กเสริมเน็ต 30 GB 7 วัน',
                      style: LNBaseTextStyle.header6_1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              '฿205',
                              style: LNBaseTextStyle.header6_2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'จากปกติ 349',
                              style: LNBaseTextStyle.discountText,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            UiButton(
                              title: 'Buy Now',
                              buttonType: ButtonType.primaryBtn,
                              width: 93,
                              height: 23,
                              borderRadius: 4,
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
