import 'package:flutter/material.dart';
import 'package:living_network/component/mode/bottomsheet_decision.dart';
import 'package:living_network/component/mode/bottomsheet_text.dart';
import 'package:living_network/component/mode/button_mode.dart' as button;
import 'package:living_network/component/notification/mode_5G_default.dart';
import 'package:living_network/component/notification/mode_warning.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool timeout = false;

class ModeWidget extends StatefulWidget {
  ModeWidget({
    super.key,
  });

  @override
  State<ModeWidget> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<ModeWidget> {
  final Future<SharedPreferences> _mode = SharedPreferences.getInstance();
  final SizedBox _sizedBox = const SizedBox(
    height: 8,
  );

  String? mode;
  DateTime? expireLiveMode;
  DateTime? expireGameMode;
  //
  // String network = '5G';
  // String currentType = '5G';

  bool isMode(String value) {
    return value == mode;
  }

  late bool error = true;
  //For disable Mode
  // late bool isDisableMode = true;
  // late bool isDisableModeEco = false;
  // late bool isDisableModeLive = false;
  // late bool isDisableModeGame = false;
  // late bool isLive = false;
  // late bool isGame = false;

  String warningMessage =
      'You are currently using 4G. Because it is outside the 5G service area.';

  @override
  void initState() {
    // setMode(null);
    super.initState();
  }

  // callback() {
  //   setState(() {
  //     setMode('max');
  //   });
  // }

  // setMode(String? setMode) async {
  //   final SharedPreferences mode1 = await _mode;
  //   setState(() {
  //     if (network == '5G' && currentType == '5G') {
  //       int ecoMode = mode1.getInt('ecoMode') ?? 0;
  //       if (setMode != null) {
  //         if (mode1.getString('mode') == 'live' && setMode != 'live') {
  //           mode1.setString('modeLiveTime', 'expire');
  //           expireLiveMode = null;
  //           isDisableModeLive = true;
  //           isLive = false;
  //         } else if (mode1.getString('mode') == 'game' && setMode != 'game') {
  //           mode1.setString('modeGameTime', 'expire');
  //           expireGameMode = null;
  //           isDisableModeGame = true;
  //           isGame = false;
  //         }
  //         if (setMode == 'eco') {
  //           mode1.setInt('ecoMode', ++ecoMode);
  //         } else if (mode1.getString('mode') == 'eco') {
  //           if (ecoMode >= 5) {
  //             isDisableModeEco = true;
  //           }
  //         }
  //         mode1.setString('mode', setMode);
  //         mode = setMode;
  //       } else {
  //         if (mode1.getString('mode') != null) {
  //           mode = mode1.getString('mode')!;
  //         } else {
  //           mode1.setString('mode', 'max');
  //           mode = 'max';
  //         }
  //         if (mode1.getString('mode') == 'live') {
  //           String time = mode1.getString('modeLiveTime') ?? '';
  //           DateTime dateLive = DateTime.parse(time);
  //           DateTime dateNow = DateTime.now();
  //           if (dateLive.difference(dateNow).inSeconds < 0) {
  //             print('test');
  //             mode1.setString('modeLiveTime', 'expire');
  //             mode1.setString('mode', 'max');
  //             mode = 'max';
  //             isDisableModeLive = true;
  //           } else {
  //             expireLiveMode = DateTime.parse(time);
  //             isLive = true;
  //           }
  //         } else if (mode1.getString('mode') == 'game') {
  //           String time = mode1.getString('modeGameTime') ?? '';
  //           DateTime dateGame = DateTime.parse(time);
  //           DateTime dateNow = DateTime.now();
  //           if (dateGame.difference(dateNow).inSeconds < 0) {
  //             mode1.setString('modeGameTime', 'expire');
  //             mode1.setString('mode', 'max');
  //             mode = 'max';
  //             isDisableModeGame = true;
  //           } else {
  //             expireGameMode = DateTime.parse(time);
  //             isGame = true;
  //           }
  //         }
  //         if (mode1.getString('modeGameTime') == 'expire') {
  //           isDisableModeGame = true;
  //         }
  //         if (mode1.getString('modePowerTime') == 'expire') {
  //           isDisableModeLive = true;
  //         }
  //         if (ecoMode >= 5) {
  //           isDisableModeEco = true;
  //         }
  //       }
  //     } else {
  //       isDisableMode = true;
  //     }
  //   });
  // }

  // timeCountdown(String mode) async {
  //   final SharedPreferences mode1 = await _mode;
  //   if (mode == 'live') {
  //     expireLiveMode = DateTime.now().add(const Duration(seconds: 30));
  //     mode1.setString('modeLiveTime', expireLiveMode.toString());
  //   } else if (mode == 'game') {
  //     expireGameMode = DateTime.now().add(const Duration(seconds: 30));
  //     mode1.setString('modeGameTime', expireGameMode.toString());
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<LnProvider>(
      builder: (context, data, _) => Card(
        shadowColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    Image.asset(
                      ImageUtils.getImagePath('assets/images/mode_title.png'),
                      height: 44,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Mode',
                        style: LNStyle.modeWidgetTitle,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return const BottomSheetCardDialogTextMode();
                          },
                        );
                      },
                      icon: Image.asset(
                        ImageUtils.getImagePath(
                            'assets/images/exclamation_green2.png'),
                        height: 13.33,
                        width: 13.33,
                      ),
                      padding: const EdgeInsets.only(left: 5.67),
                      alignment: Alignment.centerLeft,
                    ),
                  ],
                ),
              ),
              _sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: button.ButtonMode(
                      icon: Image.asset(
                        (data.displayScreen?.mode?.isDisableMode ?? false) ||
                                (data.displayScreen?.mode?.isDisableModeLive ??
                                    false)
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_power_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_power.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: 'Power / Boost Mode',
                      detail: 'Description',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      isMode: isMode('live'),
                      isDisable:
                          (data.displayScreen?.mode?.isDisableMode ?? false) ||
                              (data.displayScreen?.mode?.isDisableModeLive ??
                                  false),
                      expireDate: expireLiveMode,
                      mode: 'modeLiveTime',
                      //setMode: callback,
                      //check: isLive,
                      onPress: () {
                        if (!isMode('live')) {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetCardDialogMode(
                                title: 'Switch to Power / Boost mode?',
                                desc: 'Detail: smoothly live',
                                textSubmitBtn: 'Switch to Live mode',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) async {
                                  Navigator.pop(context);
                                  setState(
                                    () {
                                      // isLive = true;
                                      // setMode('live');
                                      // timeCountdown('live');
                                    },
                                  );
                                },
                                onPressedCancel: (isClicked) =>
                                    Navigator.pop(context),
                              );
                            },
                          );
                        } else {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetCardDialogMode(
                                title: 'Exit From Power/Boost mode?',
                                desc: 'Detail: exit from power/boost mode',
                                textSubmitBtn: 'Exit',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(() {
                                    // setMode('nofocus');
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
                    child: button.ButtonMode(
                      icon: Image.asset(
                        (data.displayScreen?.mode?.isDisableMode ?? false) ||
                                (data.displayScreen?.mode?.isDisableModeGame ??
                                    false)
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_game_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_game.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: 'Game Mode',
                      detail: 'Server is currently full',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      isMode: isMode('game'),
                      isDisable:
                          (data.displayScreen?.mode?.isDisableMode ?? false) ||
                              (data.displayScreen?.mode?.isDisableModeGame ??
                                  false),
                      expireDate: expireGameMode,
                      mode: 'modeGameTime',
                      //setMode: callback,
                      //check: isGame,
                      onPress: () {
                        if (!isMode('game')) {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetCardDialogMode(
                                title: 'Switch to Game mode?',
                                desc:
                                    'เล่นฟรีได้ 30 นาที ใช้ได้ 1 ครั้ง \n ถ้าออกก่อนก็จะหมดสิทธิแล้ว...',
                                textSubmitBtn: 'Switch to Game mode',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(
                                    () {
                                      // isGame = true;
                                      // setMode('game');
                                      // timeCountdown('game');
                                    },
                                  );
                                },
                                onPressedCancel: (isClicked) =>
                                    Navigator.pop(context),
                              );
                            },
                          );
                        } else {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetCardDialogMode(
                                title: 'Exit From Game mode?',
                                desc: 'Detail: exit from game mode',
                                textSubmitBtn: 'Exit',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(() {
                                    // setMode('nofocus');
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
              _sizedBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: button.ButtonMode(
                      icon: Image.asset(
                        (data.displayScreen?.mode?.isDisableMode ?? false) ||
                                (data.displayScreen?.mode?.isDisableModeEco ??
                                    false)
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_eco_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_eco.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: 'Eco Mode',
                      detail: 'Save Battery',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      isMode: isMode('eco'),
                      isDisable: (data.displayScreen?.mode?.isDisableMode ??
                              false) ||
                          (data.displayScreen?.mode?.isDisableModeEco ?? false),
                      onPress: () {
                        if (!isMode('eco')) {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetCardDialogMode(
                                title: 'Switch to Eco mode?',
                                desc: 'Detail: save battery',
                                textSubmitBtn: 'Switch to Eco mode',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(() {
                                    // setMode('eco');
                                  });
                                },
                                onPressedCancel: (isClicked) =>
                                    Navigator.pop(context),
                              );
                            },
                          );
                        } else {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetCardDialogMode(
                                title: 'Exit From Eco mode?',
                                desc: 'Detail: exit from eco mode',
                                textSubmitBtn: 'Exit',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(() {
                                    // setMode('nofocus');
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
                  const Expanded(
                    child: SizedBox(
                      height: 82,
                      width: 143,
                    ),
                  ),
                ],
              ),
              _sizedBox,
              error ? const ModeWarning(warningNumber: 2) : const Mode5GDefault(),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.85,
              //   height: 52,
              //   decoration: const BoxDecoration(
              //     color: Color(0x66FFE9BD),
              //     borderRadius: BorderRadius.all(Radius.circular(8)),
              //   ),
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: ListTile(
              //           minLeadingWidth: 12,
              //           leading: Image.asset(
              //             ImageUtils.getImagePath('assets/images/warning.png'),
              //             width: 20,
              //             height: 20,
              //           ),
              //           title: Text(
              //             warningMessage,
              //             style: LNStyle.warningMessage,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              //============================== Free Trial : Next Phase ===================
              // _sizedBox,
              // Row(
              //   children: [
              //     Expanded(
              //       child: ListTile(
              //         leading: isDisableMode
              //             ? Image.asset(
              //           ImageUtils.getImagePath('assets/images/mode_internet_bw.png',),
              //           height: 44,
              //           width: 44,
              //         )
              //             : Image.asset(
              //           ImageUtils.getImagePath('assets/images/mode_internet.png',),
              //           height: 44,
              //           width: 44,
              //         ),
              //         textColor: LNColor.textColorTabBar,
              //         title: const Text(
              //           '5G Free trial',
              //           style: TextStyle(
              //             fontFamily: 'DB Heavent',
              //             color: Color(0xFF38454C),
              //             fontSize: 24,
              //             fontWeight: FontWeight.w500,
              //             fontStyle: FontStyle.normal,
              //             leadingDistribution: TextLeadingDistribution.even,
              //           ),
              //         ),
              //         subtitle: isDisableMode
              //             ? const IUWidget(
              //           topPadding: 8,
              //           maxValue: 100,
              //           markerValue: 80,
              //           barColorGradient: [
              //             LNColor.whiteSpeedCompare,
              //             LNColor.whiteSpeedCompare,
              //           ],
              //         )
              //             : const IUWidget(
              //           topPadding: 8,
              //           maxValue: 100,
              //           markerValue: 80,
              //           barColorGradient: [
              //             LNColor.speedCompare2,
              //             LNColor.speedCompare2,
              //           ],
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // showCountFreeTrial
              //     ? TimeWidget(
              //         check: true,
              //         expire: DateTime.now().add(
              //           const Duration(seconds: 5),
              //         ),
              //       )
              //     : ui.UiButton(
              //         title: 'Free trial',
              //         buttonType: ui.ButtonType.primaryBtn,
              //         borderRadius: 8,
              //         height: 54,
              //         width: MediaQuery.of(context).size.width * 0.9,
              //         onPress: () {
              //           showModalBottomSheet(
              //             context: context,
              //             builder: (BuildContext context) {
              //               return UiBottomSheetCardDialogMode(
              //                 title: 'ทดลองใช้ 5G Mode',
              //                 desc:
              //                     'เชื่อมต่อประสบการณ์ 5G Mode 1 ชั่วโมง ฟรี! \n โดยไม่มีค่าใช้จ่าย หลังจากนั้นจะกลับสู่ความเร็วตามแพ็กเกจ \n เติมของคุณโดยอัตโนมัติ',
              //                 textSubmitBtn: 'Start free trial',
              //                 onPressedSubmit: (isClicked) {
              //                   Navigator.pop(context);
              //                   setState(() {
              //                     showCountFreeTrial = true;
              //                   });
              //                 },
              //                 onPressedCancel: (isClicked) =>
              //                     Navigator.pop(context),
              //               );
              //             },
              //           );
              //         },
              //       ),
              //============================== Free Trial : Next Phase ===================
            ],
          ),
        ),
      ),
    );
  }
}
