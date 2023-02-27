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
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: BaseColorsLN.kellyGreen500,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    side: const BorderSide(
                                      width: 1,
                                      color: BaseColorsLN.kellyGreen500,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Buy Now",
                                  style: LNBaseTextStyle.saleButton,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // UiButton(
                        //   title: 'Buy Now',
                        //   textStyle: TextStyle(
                        //     fontFamily: 'DB Heavent',
                        //     color: BaseColorsLN.whiteColor,
                        //     fontSize: 12,
                        //     fontWeight: FontWeight.w400,
                        //     fontStyle: FontStyle.normal,
                        //     leadingDistribution: TextLeadingDistribution.even,
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        //   buttonType: ButtonType.primaryBtn,
                        //   width: 93,
                        //   height: 29,
                        //   borderRadius: 4,
                        // ),
                      ],
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
