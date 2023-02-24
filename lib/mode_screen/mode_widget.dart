import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/internet_usage/iu_widget.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_decision.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_text.dart';
import 'package:ui_style/ui_style.dart' as ui;
import 'package:living_network/mode_screen/button/ui_button.dart' as button;

import 'time_widget.dart';

class ModeWidget extends StatefulWidget {
  //bool phone, package;
  const ModeWidget({
    super.key,
    /*required this.phone, required this.package*/
  });

  @override
  State<ModeWidget> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<ModeWidget> {
  String mode = 'max';
  bool isMode(String value) {
    return value == mode;
  }

  int countLiveModeTimeWidget = 0;
  int countGameModeTimeWidget = 0;

  late String packageMode = '5G',
      packageName,
      packageState = 'active',
      currentMode = 'maxmode';
  late num maxQuota;
  late num speed;
  late bool fup = false;
  late double reaminingQuota;
  late DateTime startDate;
  DateTime? expireGameMode;
  DateTime? expireLiveMode;
  late bool showCountFreeTrial = false;

  bool enableLiveMode() {
    return speed > 4 && fup;
  }

  bool enableGameMode() {
    return speed > 4 && fup;
  }

  //For disable Mode 'backgroudcolor'
  late int disableBackgroudColor = 0xFFEEF8E8;
  late int? disableBorderColor = 0xFFEEF8E8;
  late int? disableTitleColor = 0xFF38454C;
  late int? disableColorDetail = 0xFF9EDE3E;
  late bool isDiableMode = false;

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
    } else {}
    return Card(
      color: Colors.blueGrey,
      child: Container(
        // height: 232,
        // width: 327,
        decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
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
                    const Padding(
                      // padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: EdgeInsets.only(left: 8),
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
                              return const UiBottomSheetCardDialogTextMode();
                            },
                          );
                        },
                        icon: Image.asset(
                          'packages/living_network/assets/images/information.png',
                          height: 13.33,
                          width: 13.33,
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: button.UiButtonMode(
                      icon: isDiableMode
                          ? Image.asset(
                              'packages/living_network/assets/images/mode_max_bw.png',
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
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
                      backgroundColor: Color(disableBackgroudColor),
                      borderColor: isDiableMode
                          ? Color(disableBorderColor!)
                          : isMode('max')
                              ? const Color(0xFF64CA00)
                              : const Color(0xFFEEF8E8),
                      colorTitle: Color(disableTitleColor!),
                      colorDetail: Color(disableColorDetail!),
                      isDisable: isDiableMode,
                      onPress: () {
                        if (!isMode('max')) {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Max mode?',
                                desc: 'Detail: Default Mode',
                                textSubmitBtn: 'Switch to Max mode',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(() {
                                    mode = 'max';
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
                      icon: isDiableMode
                          ? Image.asset(
                              'packages/living_network/assets/images/mode_eco_bw.png',
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
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
                      backgroundColor: Color(disableBackgroudColor),
                      borderColor: isDiableMode
                          ? Color(disableBorderColor!)
                          : isMode('eco')
                              ? const Color(0xFF64CA00)
                              : const Color(0xFFEEF8E8),
                      colorTitle: Color(disableTitleColor!),
                      colorDetail: Color(disableColorDetail!),
                      isDisable: isDiableMode,
                      onPress: () {
                        if (!isMode('eco')) {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Eco mode?',
                                desc: 'Detail: save battery',
                                textSubmitBtn: 'Switch to Eco mode',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(() {
                                    mode = 'eco';
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
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: button.UiButtonMode(
                      icon: isDiableMode
                          ? Image.asset(
                              'packages/living_network/assets/images/mode_live_bw.png',
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
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
                      backgroundColor: Color(disableBackgroudColor),
                      borderColor: isDiableMode
                          ? Color(disableBorderColor!)
                          : isMode('live')
                              ? const Color(0xFF64CA00)
                              : const Color(0xFFEEF8E8),
                      colorTitle: Color(disableTitleColor!),
                      colorDetail: Color(disableColorDetail!),
                      isDisable: isDiableMode,
                      expireDate: expireLiveMode,
                      onPress: () {
                        if (!isMode('live')) {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Live mode?',
                                desc: 'Detail: smoothly live',
                                textSubmitBtn: 'Switch to Live mode',
                                onPressedSubmit: (isClicked) {
                                  if (countLiveModeTimeWidget == 1) {
                                    isDiableMode = true;
                                  } else {
                                    Navigator.pop(context);
                                    setState(() {
                                      mode = 'live';
                                      countLiveModeTimeWidget++;
                                      expireLiveMode = DateTime.now()
                                          .add(const Duration(seconds: 5));
                                    });
                                  }
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
                      icon: isDiableMode
                          ? Image.asset(
                              'packages/living_network/assets/images/mode_game_bw.png',
                              height: 24,
                              width: 24,
                            )
                          : Image.asset(
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
                      backgroundColor: Color(disableBackgroudColor),
                      borderColor: isDiableMode
                          ? Color(disableBorderColor!)
                          : isMode('game')
                              ? const Color(0xFF64CA00)
                              : const Color(0xFFEEF8E8),
                      colorTitle: Color(disableTitleColor!),
                      colorDetail: Color(disableColorDetail!),
                      isDisable: isDiableMode,
                      expireDate: expireGameMode,
                      onPress: () {
                        if (!isMode('game')) {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Game mode?',
                                desc: 'Detail: Lower Latency',
                                textSubmitBtn: 'Switch to Game mode',
                                onPressedSubmit: (isClicked) {
                                  if (countGameModeTimeWidget == 1) {
                                    isDiableMode = true;
                                  } else {
                                    Navigator.pop(context);
                                    setState(() {
                                      mode = 'game';
                                      countGameModeTimeWidget++;
                                      expireGameMode = DateTime.now()
                                          .add(const Duration(seconds: 5));
                                    });
                                  }
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
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    child: ListTile(
                      leading: isDiableMode
                          ? Image.asset(
                              'packages/living_network/assets/images/mode_internet_bw.png',
                              height: 44,
                              width: 44,
                            )
                          : Image.asset(
                              'packages/living_network/assets/images/mode_internet.png',
                              height: 44,
                              width: 44,
                            ),
                      textColor: BaseColorsLN.textColorTabbar,
                      title: const Text(
                        '5G Free trial',
                        style: TextStyle(
                          fontFamily: 'DB Heavent',
                          // fontFamilyFallback: ['NotoSansThaiUI'],
                          color: Color(0xFF38454C),
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          leadingDistribution: TextLeadingDistribution.even,
                          //height: 1.5,
                          //letterSpacing: -0.4,
                        ),
                      ),
                      subtitle: isDiableMode
                          ? const IUWidget(
                              maxValue: 100,
                              markerValue: 80,
                              barColorGradient: [
                                Color(0xFFF2F4F6),
                                Color(0xFFF2F4F6),
                              ],
                            )
                          : const IUWidget(
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
              showCountFreeTrial
                  ? TimeWidget(
                      expire: DateTime.now().add(
                        const Duration(seconds: 5),
                      ),
                    )
                  : ui.UiButton(
                      title: 'Free trial',
                      buttonType: ui.ButtonType.primaryBtn,
                      borderRadius: 8,
                      height: 54,
                      width: MediaQuery.of(context).size.width * 0.9,
                      onPress: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return UiBottomSheetCardDialogMode(
                              title: 'ทดลองใช้ 5G Mode',
                              desc:
                                  'เชื่อมต่อประสบการณ์ 5G Mode 1 ชั่วโมง ฟรี! \n โดยไม่มีค่าใช้จ่าย หลังจากนั้นจะกลับสู่ความเร็วตามแพ็กเกจ \n เติมของคุณโดยอัตโนมัติ',
                              textSubmitBtn: 'Start free trial',
                              onPressedSubmit: (isClicked) {
                                Navigator.pop(context);
                                setState(() {
                                  showCountFreeTrial = true;
                                });
                              },
                              onPressedCancel: (isClicked) =>
                                  Navigator.pop(context),
                            );
                          },
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
