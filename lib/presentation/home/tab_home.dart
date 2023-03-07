// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/utility/image_utils.dart';

import '../../component/mode/ui_button.dart';

class TabHome extends StatefulWidget {
  static const ROUTE_NAME = '/livingnetwork/home';
  const TabHome({super.key});

  @override
  State<TabHome> createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageUtils.getImagePath('assets/images/background.png')), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 24,
            ),
            Image.asset(
              ImageUtils.getImagePath('assets/images/ais_fibre.png'),
              width: 200,
              height: 100,
            ),
            SizedBox(
              height: 32,
            ),
            Text(
                'Network Quality Assurance network signal with real-time\n information to answer every aspect Let customers use\n home internet with peace of mind.',
                textAlign: TextAlign.center,
                style: LNStyle.homeTitleText),
            SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Column(
                  children: [
                    Image.asset(
                      ImageUtils.getImagePath('assets/images/image_2.png'),
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Solve the\nproblem in 24\nhours.',
                      textAlign: TextAlign.center,
                      style: LNStyle.homeButtonText,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      ImageUtils.getImagePath('assets/images/image_3.png'),
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'fast\ninstallation\n',
                      textAlign: TextAlign.center,
                      style: LNStyle.homeButtonText,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      ImageUtils.getImagePath('assets/images/image_4.png'),
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'appointment\ntechnician on\ntime',
                      textAlign: TextAlign.center,
                      style: LNStyle.homeButtonText,
                    ),
                  ],
                ),
                SizedBox(),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            UiButton(
              title: 'Coming Soon',
              buttonType: ButtonType.primaryBtn,
              isDisable: true,
              borderRadius: 8,
              height: 54,
            ),
            SizedBox(
              height: 13,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 53),
              child: Image.asset(
                ImageUtils.getImagePath('assets/images/image_1.png'),
                width: 397,
                // alignment: Alignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
