// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_const_constructors, dead_code, prefer_const_literals_to_create_immutables, unnecessary_new, unused_label, sized_box_for_whitespace, avoid_init_to_null
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/internet_usage/iu_widget.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_decision.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_text.dart';
import 'package:living_network/mode_screen/tab_bar/mode_tab_bar.dart';
import 'package:living_network/mode_screen/time_widget.dart';
import 'package:ui_style/base_color.dart';
import 'package:ui_style/ui_style.dart' as ui;
import 'package:living_network/mode_screen/button/ui_button.dart' as button;

class ModeWidget extends StatefulWidget {
  const ModeWidget({super.key});

  @override
  State<ModeWidget> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<ModeWidget> {
  late bool focusMaxMode = false;
  late bool focusEcoMode = false;
  late bool focusLiveMode = false;
  late bool focusGameMode = false;

  late String packageMode = '5G',
      packageName,
      packageState = 'active',
      currentMode = 'maxmode';
  late num maxQuota;
  late num speed;
  late bool fup = false;
  late double reaminingQuota;
  late DateTime startDate, expireDate;

  bool isSelectedMode = false;

  SizedBox btwRow = SizedBox(
    height: 5,
  );

  bool enableLiveMode() {
    return speed > 4 && fup;
  }

  bool enableGameMode() {
    return speed > 4 && fup;
  }

  String getCurrentMode() {
    return currentMode;
  }

  TextStyle titleStyleMode = TextStyle(
    fontFamily: 'DB Heavent',
    // fontFamilyFallback: ['NotoSansThaiUI'],
    color: Color(0xFF38454C),
    fontSize: 26,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
    //leadingDistribution: TextLeadingDistribution.even,
    //height: 1.5,
    //letterSpacing: -0.4,
  );

  //For Active Mode

  //For disable Mode 'backgroudcolor'
  late int disableBackgroudColor = 0xFFEEF8E8;
  late int? disableBorderColor = 0xFFEEF8E8;
  late int? disableTitleColor = 0xFF38454C;
  late int? disableColorDetail = 0xFF9EDE3E;
  late bool isDiableMode = false;
  late Image imageMax = Image.asset(
    'packages/living_network/assets/images/mode_max.png',
    height: 15,
    width: 15,
  );
  late Image imageEco = Image.asset(
    'packages/living_network/assets/images/mode_eco.png',
    height: 15,
    width: 15,
  );
  late Image imageLive = Image.asset(
    'packages/living_network/assets/images/mode_live.png',
    height: 15,
    width: 15,
  );
  late Image imageGame = Image.asset(
    'packages/living_network/assets/images/mode_game.png',
    height: 15,
    width: 15,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (packageMode == '4G' && packageState == 'disable') {
      disableBackgroudColor = 0xFFFAFAFA;
      disableBorderColor = 0xFFFAFAFA;
      disableTitleColor = 0xFF7B8E98;
      disableColorDetail = 0xFFB0BEC5;
      isDiableMode = true;
      if (isDiableMode) {
        imageMax = Image.asset(
          'packages/living_network/assets/images/mode_max_bw.png',
          height: 15,
          width: 15,
        );
        imageEco = Image.asset(
          'packages/living_network/assets/images/mode_eco_bw.png',
          height: 15,
          width: 15,
        );
        imageLive = Image.asset(
          'packages/living_network/assets/images/mode_live_bw.png',
          height: 15,
          width: 15,
        );
        imageGame = Image.asset(
          'packages/living_network/assets/images/mode_game_bw.png',
          height: 15,
          width: 15,
        );
      }
    } else if (packageMode == '5G' && packageState == 'active') {
      if (currentMode == 'maxmode') {
        !focusMaxMode;
      } else if (currentMode == 'ecomode') {
        !focusEcoMode;
      } else if (currentMode == 'livemode') {
        !focusLiveMode;
      } else if (currentMode == 'gamemode') {
        !focusGameMode;
      }
    } else {}
    return Card(
      color: Colors.blueGrey,
      child: Container(
        // height: 232,
        // width: 327,
        decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              // padding: const EdgeInsets.symmetric(horizontal: 10.0),
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'packages/living_network/assets/images/mode_title.png',
                    height: 44,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    padding: const EdgeInsets.only(left: 8),
                    child: Text('Mode', style: titleStyleMode
                        //textAlign: TextAlign.center,
                        ),
                  ),
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return UiBottomSheetCardDialogTextMode();
                        },
                      );
                    },
                    icon: Image.asset(
                      'packages/living_network/assets/images/information.png',
                      height: 13.33,
                      width: 13.33,
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: button.UiButtonMode(
                    icon: imageMax,
                    title: 'Max Mode',
                    detail: 'default',
                    buttonType: button.ButtonType.primaryBtn,
                    height: 70,
                    width: 143,
                    borderRadius: 10,
                    backgroundColor: Color(disableBackgroudColor),
                    borderColor: isDiableMode
                        ? Color(disableBorderColor!)
                        : focusMaxMode
                            ? Color(0xFF64CA00)
                            : Color(0xFFEEF8E8),
                    colorTitle: Color(disableTitleColor!),
                    colorDetail: Color(disableColorDetail!),
                    isDisable: isDiableMode,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return UiBottomSheetCardDialogMode(
                            title: 'Switch to Max mode?',
                            desc: 'Detail: save battery',
                            textSubmitBtn: 'Switch to Max mode',
                            onPressedSubmit: (isClicked) {
                              print("active");
                              setState(() {
                                Navigator.pop(context);
                                focusMaxMode = true;
                              });
                            },
                            onPressedCancel: (isClicked) =>
                                Navigator.pop(context),
                          );
                        },
                      );
                    },
                  ),
                ),
                Expanded(
                  child: button.UiButtonMode(
                    icon: imageEco,
                    title: 'Eco Mode',
                    detail: 'Save Battery',
                    buttonType: button.ButtonType.primaryBtn,
                    height: 70,
                    width: 143,
                    borderRadius: 10,
                    backgroundColor: Color(disableBackgroudColor),
                    borderColor: Color(disableBorderColor!),
                    colorTitle: Color(disableTitleColor!),
                    colorDetail: Color(disableColorDetail!),
                    isDisable: isDiableMode,
                    onPress: () {
                      if (focusEcoMode) {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return UiBottomSheetCardDialogMode(
                              title: 'Switch to Eco mode?',
                              desc: 'Detail: save battery',
                              textSubmitBtn: 'Switch to Eco mode',
                              onPressedSubmit: (isClicked) {
                                print("active");
                              },
                              onPressedCancel: (isClicked) =>
                                  Navigator.pop(context),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: button.UiButtonMode(
                    icon: imageLive,
                    title: 'Live Mode',
                    detail: 'Stream Smoothly',
                    buttonType: button.ButtonType.primaryBtn,
                    height: 70,
                    width: 143,
                    borderRadius: 10,
                    backgroundColor: Color(disableBackgroudColor),
                    borderColor: Color(disableBorderColor!),
                    colorTitle: Color(disableTitleColor!),
                    colorDetail: Color(disableColorDetail!),
                    isDisable: isDiableMode,
                    onPress: () {
                      if (focusLiveMode) {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return UiBottomSheetCardDialogMode(
                              title: 'Switch to Live mode?',
                              desc: 'Detail: save battery',
                              textSubmitBtn: 'Switch to Live mode',
                              onPressedSubmit: (isClicked) {
                                print("active");
                                setState(() {
                                  Navigator.pop(context);
                                  disableBorderColor = 0xFF64CA00;
                                });
                              },
                              onPressedCancel: (isClicked) =>
                                  Navigator.pop(context),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
                Expanded(
                  child: button.UiButtonMode(
                    icon: imageGame,
                    title: 'Game Mode',
                    detail: 'Lower Latency',
                    buttonType: button.ButtonType.primaryBtn,
                    height: 70,
                    width: 143,
                    borderRadius: 10,
                    backgroundColor: Color(disableBackgroudColor),
                    borderColor: Color(disableBorderColor!),
                    colorTitle: Color(disableTitleColor!),
                    colorDetail: Color(disableColorDetail!),
                    isDisable: isDiableMode,
                    onPress: () {
                      if (focusGameMode) {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return UiBottomSheetCardDialogMode(
                              title: 'Switch to Game mode?',
                              desc: 'Detail: save battery',
                              textSubmitBtn: 'Switch to Game mode',
                              onPressedSubmit: (isClicked) {
                                print("active");
                              },
                              onPressedCancel: (isClicked) =>
                                  Navigator.pop(context),
                            );
                          },
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: Image.asset(
                      'packages/living_network/assets/images/mode_internet.png',
                      height: 44,
                      width: 44,
                    ),
                    textColor: BaseColorsLN.textColorTabbar,
                    title: Text(
                      '5G Free trial',
                      style: TextStyle(
                        fontFamily: 'DB Heavent',
                        // fontFamilyFallback: ['NotoSansThaiUI'],
                        color: Color(0xFF38454C),
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        //leadingDistribution: TextLeadingDistribution.even,
                        //height: 1.5,
                        //letterSpacing: -0.4,
                      ),
                    ),
                    subtitle: IUWidget(
                      maxValue: 100,
                      markerValue: 80,
                      barColorGradient: [
                        BaseColorsLN.speedCompare2,
                        BaseColorsLN.speedCompare2,
                      ],
                    ),
                  ),
                )
              ],
            ),
            // Container(
            //   height: 54,
            //   width: 295,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Free trial will expire:           ',
            //         style: TextStyle(
            //           fontFamily: 'DB Heavent',
            //           // fontFamilyFallback: ['NotoSansThaiUI'],
            //           color: Color(0xFF657884),
            //           fontSize: 18,
            //           fontWeight: FontWeight.w500,
            //           fontStyle: FontStyle.normal,
            //         ),
            //       ),
            TimeWidget(
              expire: DateTime.now().add(Duration(days: 1)),
            ),
            // ],
            // ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget showFreeTrial() {
    return Card(
      child: Container(
        height: 54,
        width: 295,
        decoration: BoxDecoration(color: Color(0xFF64CA00)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Free trial',
              style: TextStyle(
                fontFamily: 'DB Heavent',
                // fontFamilyFallback: ['NotoSansThaiUI'],
                color: Color(0xFF657884),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
            TimeWidget(
              expire: DateTime(2023, 2, 21, 15, 30),
            ),
          ],
        ),
      ),
    );
  }

  Widget closeFreeTrial() {
    return Card(
      child: Container(
        height: 54,
        width: 295,
        decoration: BoxDecoration(color: Color(0xFFF2F4F6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Free trial will expire:     ',
              style: TextStyle(
                fontFamily: 'DB Heavent',
                // fontFamilyFallback: ['NotoSansThaiUI'],
                color: Color(0xFF657884),
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.normal,
              ),
            ),
            TimeWidget(
              expire: DateTime(2023, 2, 21, 15, 30),
            ),
          ],
        ),
      ),
    );
  }
}
