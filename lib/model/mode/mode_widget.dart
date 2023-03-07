import 'package:flutter/material.dart';
import 'package:living_network/component/mode/ui_bottomsheet_decision.dart';
import 'package:living_network/component/mode/ui_bottomsheet_text.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:living_network/utility/ui_button_mode.dart'
    as button;

bool timeout = false;

class ModeWidget extends StatefulWidget {
  String network;
  String package;
  bool soc, faultManagement, ds4;

  ModeWidget({
    required this.network,
    required this.package,
    required this.soc,
    required this.faultManagement,
    required this.ds4,
    super.key,
  });

  @override
  State<ModeWidget> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<ModeWidget> {
  final Future<SharedPreferences> _mode = SharedPreferences.getInstance();

  String? mode;
  DateTime? expireLiveMode;
  DateTime? expireGameMode;

  bool isMode(String value) {
    return value == mode;
  }

  //For disable Mode 'backgroundcolor'
  late int disableBackgroundColor = 0xFFEEF8E8;
  late int? disableBorderColor = 0xFFEEF8E8;
  late int? disableTitleColor = 0xFF38454C;
  late int? disableDetailColor = 0xFF9EDE3E;
  late bool isDisableMode = false;
  late bool isDisableModeEco = false;
  late bool isDisableModeLive = false;
  late bool isDisableModeGame = false;
  late bool isLive = false;
  late bool isGame = false;

  String warningMessage =
      'You are currently using 4G. Because it is outside the 5G service area.';

  SizedBox betweenBox = const SizedBox(
    height: 8,
  );

  @override
  void initState() {
    checkNetwork('5G', 'Pack5G', true, true, true);
    setMode(null);
    super.initState();
  }

  checkNetwork(String networkType, String currentType, bool callID, bool alarm,
      bool eco) {
    if (networkType == '5G' && currentType == 'Pack5G') {
      if (eco) {
        if (callID && alarm) {
          isDisableModeLive = true;
        } else {
          isDisableModeGame = true;
          isDisableModeLive = true;
        }
      } else {
        isDisableModeGame = true;
        isDisableModeEco = true;
        isDisableModeLive = true;
      }
    } else {
      isDisableMode = true;
    }
  }

  callback() {
    setState(() {
      setMode('max');
    });
  }

  setMode(String? setMode) async {
    final SharedPreferences mode1 = await _mode;
    setState(() {
      if (widget.network == '5G' && widget.package == 'Pack5G') {
        int ecoMode = mode1.getInt('ecoMode') ?? 0;
        if (setMode != null) {
          if (mode1.getString('mode') == 'live' && setMode != 'live') {
            mode1.setString('modeLiveTime', 'expire');
            expireLiveMode = null;
            isDisableModeLive = true;
            isLive = false;
          } else if (mode1.getString('mode') == 'game' && setMode != 'game') {
            mode1.setString('modeGameTime', 'expire');
            expireGameMode = null;
            isDisableModeGame = true;
            isGame = false;
          }
          if (setMode == 'eco') {
            mode1.setInt('ecoMode', ++ecoMode);
          } else if (mode1.getString('mode') == 'eco') {
            if (ecoMode >= 5) {
              isDisableModeEco = true;
            }
          }
          mode1.setString('mode', setMode);
          mode = setMode;
        } else {
          if (mode1.getString('mode') != null) {
            mode = mode1.getString('mode')!;
          } else {
            mode1.setString('mode', 'max');
            mode = 'max';
          }
          if (mode1.getString('mode') == 'live') {
            String time = mode1.getString('modeLiveTime') ?? '';
            DateTime dateLive = DateTime.parse(time);
            DateTime dateNow = DateTime.now();
            if (dateLive.difference(dateNow).inSeconds < 0) {
              print('test');
              mode1.setString('modeLiveTime', 'expire');
              mode1.setString('mode', 'max');
              mode = 'max';
              isDisableModeLive = true;
            } else {
              expireLiveMode = DateTime.parse(time);
              isLive = true;
            }
          } else if (mode1.getString('mode') == 'game') {
            String time = mode1.getString('modeGameTime') ?? '';
            DateTime dateGame = DateTime.parse(time);
            DateTime dateNow = DateTime.now();
            if (dateGame.difference(dateNow).inSeconds < 0) {
              mode1.setString('modeGameTime', 'expire');
              mode1.setString('mode', 'max');
              mode = 'max';
              isDisableModeGame = true;
            } else {
              expireGameMode = DateTime.parse(time);
              isGame = true;
            }
          }
          if (mode1.getString('modeGameTime') == 'expire') {
            isDisableModeGame = true;
          }
          if (mode1.getString('modeLiveTime') == 'expire') {
            isDisableModeLive = true;
          }
          if (ecoMode >= 5) {
            isDisableModeEco = true;
          }
        }
      } else {
        isDisableMode = true;
      }
    });
  }

  timeCountdown(String mode) async {
    final SharedPreferences mode1 = await _mode;
    if (mode == 'live') {
      expireLiveMode = DateTime.now().add(const Duration(hours: 3));
      mode1.setString('modeLiveTime', expireLiveMode.toString());
    } else if (mode == 'game') {
      expireGameMode = DateTime.now().add(const Duration(seconds: 3));
      mode1.setString('modeGameTime', expireGameMode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    // setMode(null);
    return Card(
      shadowColor: Colors.transparent,
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                              return const UiBottomSheetCardDialogTextMode();
                            },
                          );
                        },
                        icon: Image.asset(
                          ImageUtils.getImagePath(
                              'assets/images/information.png'),
                          height: 13.33,
                          width: 13.33,
                        ))
                  ],
                ),
              ),
              betweenBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: button.UiButtonMode(
                      icon: Image.asset(
                        isDisableMode
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_max_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_max.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: 'Max Mode',
                      detail: 'default',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 82,
                      width: 143,
                      borderRadius: 10,
                      isMode: isMode('max'),
                      isDisable: isDisableMode,
                      onPress: () {
                        if (!isMode('max')) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Max mode?',
                                desc: 'Detail: Default Mode',
                                textSubmitBtn: 'Switch to Max mode',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(() {
                                    setMode('max');
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
                      icon: Image.asset(
                        isDisableMode || isDisableModeEco
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
                      height: 82,
                      width: 143,
                      borderRadius: 10,
                      isMode: isMode('eco'),
                      isDisable: isDisableMode || isDisableModeEco,
                      onPress: () {
                        if (!isMode('eco')) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Eco mode?',
                                desc: 'Detail: save battery',
                                textSubmitBtn: 'Switch to Eco mode',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(() {
                                    setMode('eco');
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
              betweenBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: button.UiButtonMode(
                      icon: Image.asset(
                        isDisableMode || isDisableModeLive
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_live_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_live.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: 'Live Mode',
                      detail: 'Stream Smoothly',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 82,
                      width: 143,
                      borderRadius: 10,
                      isMode: isMode('live'),
                      isDisable: isDisableMode || isDisableModeLive,
                      expireDate: expireLiveMode,
                      mode: 'modeLiveTime',
                      setMode: callback,
                      check: isLive,
                      onPress: () {
                        if (!isMode('live')) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Live mode?',
                                desc: 'Detail: smoothly live',
                                textCancelBtn: 'Close',
                                textSubmitBtn: 'Switch to Live mode',
                                onPressedSubmit: (isClicked) async {
                                  Navigator.pop(context);
                                  setState(
                                    () {
                                      isLive = true;
                                      setMode('live');
                                      timeCountdown('live');
                                    },
                                  );
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
                        isDisableMode || isDisableModeGame
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_game_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_game.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: 'Game Mode',
                      detail: 'Lower Latency',
                      buttonType: button.ButtonType.primaryBtn,
                      height: 82,
                      width: 143,
                      borderRadius: 10,
                      isMode: isMode('game'),
                      isDisable: isDisableMode || isDisableModeGame,
                      expireDate: expireGameMode,
                      mode: 'modeGameTime',
                      setMode: callback,
                      check: isGame,
                      onPress: () {
                        if (!isMode('game')) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogMode(
                                title: 'Switch to Game mode?',
                                desc: 'Detail: Lower Latency',
                                textSubmitBtn: 'Switch to Game mode',
                                textCancelBtn: 'Close',
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  setState(
                                    () {
                                      isGame = true;
                                      setMode('game');
                                      timeCountdown('game');
                                    },
                                  );
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
              betweenBox,
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 52,
                decoration: const BoxDecoration(
                  color: Color(0x66FFE9BD),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        minLeadingWidth: 12,
                        leading: Image.asset(
                          ImageUtils.getImagePath('assets/images/warning.png'),
                          width: 20,
                          height: 20,
                        ),
                        title: Text(
                          warningMessage,
                          style: LNStyle.warningMessage,
                        ),
                      ),
                    ),
                  ],
                ),
              )

              //============================== Free Trial : Next Phase ===================
              // betweenBox,
              // Row(
              //   children: [
              //     Expanded(
              //       child: ListTile(
              //         leading: isDisableMode
              //             ? Image.asset(
              //           ImageUtils.getImagePath('assets/images/mode_internet_bw.png',
              //           height: 44,
              //           width: 44,
              //         )
              //             : Image.asset(
              //           ImageUtils.getImagePath('assets/images/mode_internet.png',
              //           height: 44,
              //           width: 44,
              //         ),
              //         textColor: BaseColorsLN.textColorTabbar,
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
              //             BaseColorsLN.whiteSpeedCompare,
              //             BaseColorsLN.whiteSpeedCompare,
              //           ],
              //         )
              //             : const IUWidget(
              //           topPadding: 8,
              //           maxValue: 100,
              //           markerValue: 80,
              //           barColorGradient: [
              //             BaseColorsLN.speedCompare2,
              //             BaseColorsLN.speedCompare2,
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
