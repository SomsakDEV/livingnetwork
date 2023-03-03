import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/utility/image_utils.dart';

class SaleBadgeWidget extends StatefulWidget {
  const SaleBadgeWidget({super.key});

  @override
  State<SaleBadgeWidget> createState() => _SaleBadgeWidgetState();
}

class _SaleBadgeWidgetState extends State<SaleBadgeWidget> {
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
                ImageUtils.getImagePath('assets/images/sale_badge.png'),
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
                      style: LNStyle.header6_1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              '฿205',
                              style: LNStyle.header6_2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'จากปกติ 349',
                              style: LNStyle.discountText,
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
                                  style: LNStyle.saleButton,
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
