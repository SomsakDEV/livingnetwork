// ignore_for_file: prefer_const_constructors, deprecated_member_use_from_same_package, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/internet_usage/iu_widget.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_decision.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_text.dart';
import 'package:living_network/mode_screen/time_widget.dart';
import 'package:ui_style/ui_style.dart' as ui;
import 'package:living_network/mode_screen/button/ui_button.dart' as button;

class FiveGPhoneFiveGPackage extends StatefulWidget {
  const FiveGPhoneFiveGPackage({super.key});

  @override
  State<FiveGPhoneFiveGPackage> createState() => _FiveGPhoneFiveGPackageState();
}

class _FiveGPhoneFiveGPackageState extends State<FiveGPhoneFiveGPackage> {
  late bool focusMaxMode = false;
  late bool focusEcoMode = false;
  late bool focusLiveMode = false;
  late bool focusGameMode = false;

  SizedBox btwRow = SizedBox(
    height: 5,
  );
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Card(
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

                      child: Text(
                        'Mode',
                        style: TextStyle(
                          fontFamily: 'DB Heavent',
                          // fontFamilyFallback: ['NotoSansThaiUI'],
                          color: Color(0xFF38454C),
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          //leadingDistribution: TextLeadingDistribution.even,
                          //height: 1.5,
                          //letterSpacing: -0.4,
                        ),
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
                      icon: Image.asset(
                        'packages/living_network/assets/images/mode_max.png',
                        height: 24,
                        width: 24,
                      ),
                      title: 'Max Mode',
                      detail: 'default',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 82,
                      width: 143,
                      borderRadius: 10,
                      borderColor:
                          focusMaxMode ? ui.BaseColors.kellyGreen500 : null,
                      onPress: () {
                        print(focusMaxMode);
                        if (!focusMaxMode) {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Max mode?',
                                desc: 'Detail: save battery',
                                textSubmitBtn: 'Switch to Eco mode',
                                onPressedSubmit: (isClicked) {

                                  setState(() {
                                    focusMaxMode = true;
                                    focusEcoMode = false;
                                    focusLiveMode = false;
                                    focusGameMode = false;
                                    Navigator.pop(context);
                                  });

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
                  Expanded(
                    child: button.UiButtonMode(
                      icon: Image.asset(
                        'packages/living_network/assets/images/mode_eco.png',
                        height: 24,
                        width: 24,
                      ),
                      title: 'Eco Mode',
                      detail: 'Save Battery',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 82,
                      width: 143,
                      borderRadius: 10,
                      borderColor:
                          focusEcoMode ? ui.BaseColors.kellyGreen500 : null,
                      onPress: () {
                        if (!focusEcoMode) {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Eco mode?',
                                desc: 'Detail: save battery',
                                textSubmitBtn: 'Switch to Eco mode',
                                onPressedSubmit: (isClicked) {
                                  setState(() {
                                    focusMaxMode = false;
                                    focusEcoMode = true;
                                    focusLiveMode = false;
                                    focusGameMode = false;
                                    Navigator.pop(context);
                                  });

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
                children: [
                  Expanded(
                    child: button.UiButtonMode(
                      icon: Image.asset(
                        'packages/living_network/assets/images/mode_live.png',
                        height: 24,
                        width: 24,
                      ),
                      title: 'Live Mode',
                      detail: 'Stream Smoothly',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 82,
                      width: 143,
                      borderRadius: 10,
                      borderColor:
                          focusLiveMode ? ui.BaseColors.kellyGreen500 : null,
                      onPress: () {
                        if (!focusLiveMode) {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Eco mode?',
                                desc: 'Detail: save battery',
                                textSubmitBtn: 'Switch to Eco mode',
                                onPressedSubmit: (isClicked) {
                                  setState(() {
                                    focusMaxMode = false;
                                    focusEcoMode = false;
                                    focusLiveMode = true;
                                    focusGameMode = false;
                                    Navigator.pop(context);
                                  });

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
                  Expanded(
                    child: button.UiButtonMode(
                      icon: Image.asset(
                        'packages/living_network/assets/images/mode_game.png',
                        height: 24,
                        width: 24,
                      ),
                      title: 'Game Mode',
                      detail: 'Lower Latency',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 82,
                      width: 143,
                      borderRadius: 10,
                      borderColor:
                          focusGameMode ? ui.BaseColors.kellyGreen500 : null,
                      // expireDate: DateTime.now().add(Duration(days: 1)),
                      onPress: () {
                        if (!focusGameMode) {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Eco mode?',
                                desc: 'Detail: save battery',
                                textSubmitBtn: 'Switch to Eco mode',
                                onPressedSubmit: (isClicked) {
                                  setState(() {
                                    focusMaxMode = false;
                                    focusEcoMode = false;
                                    focusLiveMode = false;
                                    focusGameMode = true;
                                    Navigator.pop(context);
                                  });

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
                          'packages/living_network/assets/images/mode_Internet.png'),
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
                      subtitle: IUWidget(maxValue: 100, markerValue: 80, barColorGradient: [ BaseColorsLN.speedCompare2, BaseColorsLN.speedCompare2,],),
                    ),
                  )
                ],
              ),
              TimeWidget(
                // expire: DateTime.now().add(Duration(days: 1)),
                
              )
            ],
          ),
        ),
      ),
    );
  }
}



