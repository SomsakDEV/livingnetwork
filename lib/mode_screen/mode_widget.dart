// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_const_constructors, dead_code, prefer_const_literals_to_create_immutables, unnecessary_new, unused_label, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_decision.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_text.dart';
import 'package:living_network/mode_screen/tab_bar/mode_tab_bar.dart';
import 'package:living_network/mode_screen/time_widget.dart';
import 'package:ui_style/ui_style.dart' as ui;
import 'package:living_network/mode_screen/button/ui_button.dart' as button;

class ModeWidget extends StatefulWidget {
  const ModeWidget({super.key});

  @override
  State<ModeWidget> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<ModeWidget> {
  late bool focusMaxMode = true;
  late bool focusEcoMode = false;
  late bool focusLiveMode = false;
  late bool focusGameMode = false;

  bool isSelectedMode = false;

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
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          focusMaxMode = true;
                        });
                      },
                      child: button.UiButtonMode(
                        icon: Image.asset(
                          'packages/living_network/assets/images/mode_max_bw.png',
                          height: 15,
                          width: 15,
                        ),
                        title: 'Max Mode',
                        detail: 'default',
                        buttonType: button.ButtonType.primaryBtn,
                        height: 70,
                        width: 143,
                        borderRadius: 10,
                        backgroundColor: Color(0xFFFAFAFA),
                        borderColor: Color(0xFFFAFAFA),
                        colorTitle: Color(0xFF7B8E98),
                        colorDetail: Color(0xFFB0BEC5),
                        isDisable: true,
                        onPress: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Max mode?',
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
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: button.UiButtonMode(
                      icon: Image.asset(
                        'packages/living_network/assets/images/mode_eco_bw.png',
                        height: 15,
                        width: 15,
                      ),
                      title: 'Eco Mode',
                      detail: 'Save Battery',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      backgroundColor: Color(0xFFFAFAFA),
                      borderColor: Color(0xFFFAFAFA),
                      colorTitle: Color(0xFF7B8E98),
                      colorDetail: Color(0xFFB0BEC5),
                      isDisable: true,
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
                      icon: Image.asset(
                        'packages/living_network/assets/images/mode_live_bw.png',
                        height: 15,
                        width: 15,
                      ),
                      title: 'Live Mode',
                      detail: 'Stream Smoothly',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      backgroundColor: Color(0xFFFAFAFA),
                      borderColor: Color(0xFFFAFAFA),
                      colorTitle: Color(0xFF7B8E98),
                      colorDetail: Color(0xFFB0BEC5),
                      isDisable: true,
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
                        'packages/living_network/assets/images/mode_game_bw.png',
                        height: 15,
                        width: 15,
                      ),
                      title: 'Game Mode',
                      detail: 'Lower Latency',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      backgroundColor: Color(0xFFFAFAFA),
                      borderColor: Color(0xFFFAFAFA),
                      colorTitle: Color(0xFF7B8E98),
                      colorDetail: Color(0xFFB0BEC5),
                      isDisable: true,
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
                          'packages/living_network/assets/images/mode_internet.png'),
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
                      subtitle: ModeTagBar(maxValue: 100, markerValue: 80),
                    ),
                  )
                ],
              ),
              Container(
                height: 54,
                width: 295,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Free trial will expire:           ',
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
            ],
          ),
        ),
      ),
    );
  }
}
