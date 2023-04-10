import 'dart:async';

import 'package:flutter/material.dart';
import 'package:living_network/component/mode/bottomsheet_decision.dart';
import 'package:living_network/component/mode/bottomsheet_decision_switching.dart';
import 'package:living_network/component/mode/bottomsheet_text.dart';
import 'package:living_network/component/mode/button_mode.dart' as button;
import 'package:living_network/component/notification/mode_warning.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/constance/constants.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';

class ModeWidget extends StatefulWidget {
  ModeWidget({
    super.key,
  });

  @override
  State<ModeWidget> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<ModeWidget> {
  final SizedBox _sizedBox = const SizedBox(height: 8);

  bool checkTimeMode = true;

  SnackBar snackBarMessage(BuildContext context, {String message = 'fail'}) {
    return SnackBar(
      elevation: 6.0,
      backgroundColor: LNColor.blackGrey80percent,
      behavior: SnackBarBehavior.floating,
      //change show snackBar?? from 5 to 2!!!!
      //For test!
      duration: const Duration(seconds: 5),
      content: SizedBox(
        height: 22,
        width: MediaQuery.of(context).size.width * 0.85,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 11.96),
              child: message == 'fail' ? Image.asset('assets/images/checkmark_no.png') : Image.asset('assets/images/checkmark.png'),
            ),
            message == 'success' ? Text(snackBarSuccess) : Text(snackBarUnsuccessful),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Future<void> wUpdate(InternalProvider data, bool addSocket, String mode) async {
    String img = mode == 'boost_mode'
        ? 'assets/loading_boost_mode.gif'
        : mode == 'game_mode'
            ? 'assets/loading_game_mode.gif'
            : 'assets/loading_eco_mode.gif';

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return FutureBuilder(
                future: addSocket ? data.getAddMode(mode) : data.getDeleteMode(mode),
                builder: (context, snap) {
                  if (snap.hasData) {
                    Navigator.pop(context);
                    Timer(
                      const Duration(milliseconds: 100),
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        snackBarMessage(context, message: snap.data as bool ? 'fail' : 'success'),
                      ),
                    );
                    return const SizedBox();
                  } else if (snap.hasError) {
                    Timer(
                      const Duration(milliseconds: 100),
                      () => ScaffoldMessenger.of(context).showSnackBar(snackBarMessage(context, message: 'fail')),
                    );
                    return const SizedBox();
                  } else {
                    return Container(
                      color: Colors.transparent,
                      child: Image.asset(img),
                    );
                  }
                });
          }),
    );
  }

  Future<void> expireMode(InternalProvider data) async {
    String mode = data.mode5G?.mode ?? 'max_mode';
    String img = mode == 'boost_mode'
        ? 'assets/loading_boost_mode.gif'
        : mode == 'game_mode'
            ? 'assets/loading_game_mode.gif'
            : 'assets/loading_eco_mode.gif';

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return FutureBuilder(
                future: data.getExpireMode(),
                builder: (context, snap) {
                  if (snap.hasData) {
                    Navigator.pop(context);
                    Timer(
                      const Duration(milliseconds: 100),
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        snackBarMessage(context, message: snap.data as bool ? 'fail' : 'success'),
                      ),
                    );
                    return const SizedBox();
                  } else if (snap.hasError) {
                    Timer(
                      const Duration(milliseconds: 100),
                      () => ScaffoldMessenger.of(context).showSnackBar(snackBarMessage(context, message: 'fail')),
                    );
                    return const SizedBox();
                  } else {
                    return Container(
                      color: Colors.transparent,
                      child: Image.asset(img),
                    );
                  }
                });
          }),
    );
  }

  Future<void> switchGameToBoostMode(InternalProvider data, BuildContext context) async {
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return BottomSheetDecisionCardDialogMode(
          title: switchGameExitTitle,
          desc: switchGameExitDesc,
          textSubmitBtn: textSubmitBtn,
          textCancelBtn: textCancelBtn,
          exitMode: true,
          onPressedSubmit: (isClicked) {
            Navigator.pop(context);
            if (data.mode5G?.mode != 'boost_mode') {
              showModalBottomSheet(
                isDismissible: false,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetDecisionSwitchingMode(
                    title: switchBoost,
                    textSubmitBtn: textSubmitBoost,
                    textCancelBtn: textCancelBtn,
                    isHighValue: false,
                    onPressedSubmit: (isClicked) {
                      Navigator.pop(context);
                      setState(() {
                        checkTimeMode = true;
                      });
                      wUpdate(data, true, 'boost_mode');
                    },
                    onPressedCancel: (isClicked) => Navigator.pop(context),
                  );
                },
              );
            }
          },
          onPressedCancel: (isClicked) => Navigator.pop(context),
        );
      },
    );
  }

  Future<void> chooseBoostMode(InternalProvider data, BuildContext context) async {
    if (data.mode5G?.mode != 'boost_mode') {
      showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetDecisionCardDialogMode(
            title: switchBoost,
            textSubmitBtn: textSubmitBtn,
            textCancelBtn: textCancelBtn,
            exitMode: false,
            onPressedSubmit: (isClicked) {
              Navigator.pop(context);
              setState(() {
                checkTimeMode = true;
              });
              wUpdate(data, true, 'boost_mode');
            },
            onPressedCancel: (isClicked) => Navigator.pop(context),
          );
        },
      );
    } else {
      showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetDecisionCardDialogMode(
            title: switchBoostExitTitle,
            desc: switchBoostExitDesc,
            textSubmitBtn: textSubmitBtn,
            textCancelBtn: textCancelBtn,
            exitMode: true,
            onPressedSubmit: (isClicked) {
              Navigator.pop(context);
              setState(() {
                checkTimeMode = false;
              });
              wUpdate(data, false, 'boost_mode');
            },
            onPressedCancel: (isClicked) => Navigator.pop(context),
          );
        },
      );
    }
  }

  Future<void> switchBoostToGameMode(InternalProvider data, BuildContext context) async {
    showModalBottomSheet(
      isDismissible: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return BottomSheetDecisionCardDialogMode(
          title: switchBoostExitTitle,
          desc: switchBoostExitDesc,
          textSubmitBtn: textSubmitBtn,
          textCancelBtn: textCancelBtn,
          exitMode: true,
          onPressedSubmit: (isClicked) {
            Navigator.pop(context);
            if (data.mode5G?.mode != 'game_mode') {
              showModalBottomSheet(
                isDismissible: false,
                backgroundColor: Colors.transparent,
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return BottomSheetDecisionSwitchingMode(
                    title: switchGame,
                    textSubmitBtn: textSubmitGame,
                    textCancelBtn: textCancelBtn,
                    isHighValue: false,
                    onPressedSubmit: (isClicked) {
                      Navigator.pop(context);
                      setState(() {
                        checkTimeMode = true;
                      });
                      wUpdate(data, true, 'game_mode');
                    },
                    onPressedCancel: (isClicked) => Navigator.pop(context),
                  );
                },
              );
            }
          },
          onPressedCancel: (isClicked) => Navigator.pop(context),
        );
      },
    );
  }

  Future<void> chooseGameMode(InternalProvider data, BuildContext context) async {
    if (data.mode5G?.mode != 'game_mode') {
      showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetDecisionCardDialogMode(
            title: switchGame,
            textSubmitBtn: textSubmitBtn,
            textCancelBtn: textCancelBtn,
            exitMode: false,
            onPressedSubmit: (isClicked) {
              Navigator.pop(context);
              setState(() {
                checkTimeMode = true;
              });
              wUpdate(data, true, 'game_mode');
            },
            onPressedCancel: (isClicked) => Navigator.pop(context),
          );
        },
      );
    } else {
      showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetDecisionCardDialogMode(
            title: switchGameExitTitle,
            desc: switchGameExitDesc,
            textSubmitBtn: textSubmitBtn,
            textCancelBtn: textCancelBtn,
            exitMode: true,
            onPressedSubmit: (isClicked) {
              Navigator.pop(context);
              setState(() {
                checkTimeMode = false;
              });
              wUpdate(data, false, 'game_mode');
            },
            onPressedCancel: (isClicked) => Navigator.pop(context),
          );
        },
      );
    }
  }

  Future<void> chooseEcoMode(InternalProvider data, BuildContext context) async {
    String? mode = data.mode5G?.mode;
    if (mode == 'max_mode') {
      showModalBottomSheet(
          isDismissible: false,
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return BottomSheetDecisionCardDialogMode(
              title: switchEco,
              textSubmitBtn: textSubmitBtn,
              textCancelBtn: textCancelBtn,
              exitMode: false,
              onPressedSubmit: (isClicked) async {
                Navigator.pop(context);
                setState(() {
                  checkTimeMode = false;
                });
                wUpdate(data, true, 'eco_mode');
              },
              onPressedCancel: (isClicked) => Navigator.pop(context),
            );
          });
    } else if (mode != 'eco_mode') {
      showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetDecisionCardDialogMode(
            title: mode == 'boost_mode' ? switchBoostExitTitle : switchGameExitTitle,
            desc: mode == 'boost_mode' ? switchBoostExitDesc : switchGameExitDesc,
            textSubmitBtn: textSubmitBtn,
            textCancelBtn: textCancelBtn,
            exitMode: mode == 'boost_mode' || mode == 'game_mode',
            onPressedSubmit: (isClicked) async {
              Navigator.pop(context);
              showModalBottomSheet(
                  isDismissible: false,
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return BottomSheetDecisionCardDialogMode(
                      title: switchEco,
                      textSubmitBtn: textSubmitEco,
                      textCancelBtn: textCancelBtn,
                      exitMode: false,
                      onPressedSubmit: (isClicked) async {
                        Navigator.pop(context);
                        setState(() {
                          checkTimeMode = false;
                        });
                        wUpdate(data, true, 'eco_mode');
                      },
                      onPressedCancel: (isClicked) => Navigator.pop(context),
                    );
                  });
            },
            onPressedCancel: (isClicked) => Navigator.pop(context),
          );
        },
      );
    } else {
      showModalBottomSheet(
        isDismissible: false,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return BottomSheetDecisionCardDialogMode(
            title: switchEcoExit,
            textSubmitBtn: textSubmitBtn,
            textCancelBtn: textCancelBtn,
            exitMode: true,
            onPressedSubmit: (isClicked) async {
              Navigator.pop(context);
              setState(() {
                checkTimeMode = false;
              });
              wUpdate(data, false, 'eco_mode');
            },
            onPressedCancel: (isClicked) => Navigator.pop(context),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<InternalProvider>(
      builder: (context, data, _) => Card(
        shadowColor: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Image.asset(
                      ImageUtils.getImagePath('assets/images/mode_title.png'),
                      height: 44,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        modeWidgetTitle,
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
                        ImageUtils.getImagePath('assets/images/exclamation_green2.png'),
                        height: 20,
                        width: 20,
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
                        (data.mode5G?.isDisableMode ?? false) || (data.mode5G?.isDisableModeLive ?? false) ? ImageUtils.getImagePath('assets/images/mode_power_bw.png') : ImageUtils.getImagePath('assets/images/mode_power.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: powerTitle,
                      detail: powerDesc,
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      isMode: data.mode5G?.mode == 'boost_mode',
                      isDisable: (data.mode5G?.isDisableMode ?? false) || (data.mode5G?.isDisableModeLive ?? false),
                      expireDate: data.mode5G?.mode == 'boost_mode' ? data.mode5G?.expireMode : null,
                      mode: 'modeLiveTime',
                      setMode: expireMode,
                      check: data.mode5G?.mode == 'boost_mode' ? checkTimeMode : false,
                      onPress: () {
                        // bool highValue = data.mode5G?.checkModeProfile?.is5GHighValue ?? false;
                        // if (highValue) {
                        //----------UX Flow สลับโหมดต่อแบบไม่เสียเงิน (ยังไม่หมดเวลาโหมดเก่า)
                        // chooseBoostMode(data, context, highValue);
                        //-----------------------------------------------------------------
                        // } else {
                        //----------UX Flow สลับโหมดแบบเสียเงินต่อเนื่อง 2โหมด (ยังไม่หมดเวลาโหมดเก่า)
                        String mode = data.mode5G?.mode ?? 'max_mode';
                        if (mode == 'game_mode') {
                          switchGameToBoostMode(data, context);
                        } else if (mode == 'eco_mode' || mode == 'max_mode' || mode == 'boost_mode') {
                          chooseBoostMode(data, context);
                        }
                        //-----------------------------------------------------------------
                        // }
                      },
                    ),
                  ),
                  Expanded(
                    child: button.ButtonMode(
                      icon: Image.asset(
                        (data.mode5G?.isDisableMode ?? false) || (data.mode5G?.isDisableModeGame ?? false) ? ImageUtils.getImagePath('assets/images/mode_game_bw.png') : ImageUtils.getImagePath('assets/images/mode_game.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: gameTitle,
                      detail: gameDesc,
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      isMode: data.mode5G?.mode == 'game_mode',
                      isDisable: (data.mode5G?.isDisableMode ?? false) || (data.mode5G?.isDisableModeGame ?? false),
                      expireDate: data.mode5G?.mode == 'game_mode' ? data.mode5G?.expireMode : null,
                      mode: 'modeGameTime',
                      setMode: expireMode,
                      check: data.mode5G?.mode == 'game_mode' ? checkTimeMode : false,
                      onPress: () {
                        // bool highValue = data.mode5G?.checkModeProfile?.is5GHighValue ?? false;
                        // if (highValue) {
                        //----------UX Flow สลับโหมดต่อแบบไม่เสียเงิน (ยังไม่หมดเวลาโหมดเก่า)
                        // chooseGameMode(data, context, highValue);
                        //-----------------------------------------------------------------
                        // } else {
                        //----------UX Flow สลับโหมดแบบเสียเงินต่อเนื่อง 2โหมด (ยังไม่หมดเวลาโหมดเก่า)
                        String mode = data.mode5G?.mode ?? 'max_mode';
                        if (mode == 'boost_mode') {
                          switchBoostToGameMode(data, context);
                        } else if (mode == 'eco_mode' || mode == 'max_mode' || mode == 'game_mode') {
                          chooseGameMode(data, context);
                        }
                        //-----------------------------------------------------------------
                        // }
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
                        (data.mode5G?.isDisableMode ?? false|| (data.mode5G?.isDisableModeEco ?? false)) ? ImageUtils.getImagePath('assets/images/mode_eco_bw.png') : ImageUtils.getImagePath('assets/images/mode_eco.png'),
                        height: 24,
                        width: 24,
                      ),
                      title: ecoTitle,
                      detail: ecoDesc,
                      buttonType: button.ButtonType.primaryBtn,
                      height: 70,
                      width: 143,
                      borderRadius: 10,
                      isMode: data.mode5G?.mode == 'eco_mode',
                      isDisable: (data.mode5G?.isDisableMode ?? false) || (data.mode5G?.isDisableModeEco ?? false),
                      onPress: () {
                        chooseEcoMode(data, context);
                        // if (highValue) {
                        //   //----------UX Flow สลับโหมดแบบเสียเงินต่อเนื่อง 2โหมด (ยังไม่หมดเวลาโหมดเก่า)
                        //   chooseEcoMode(data, context, highValue);
                        //   //-----------------------------------------------------------------
                        // } else {
                        //   //----------UX Flow สลับโหมดต่อแบบไม่เสียเงิน (ยังไม่หมดเวลาโหมดเก่า)
                        //   chooseEcoMode(data, context, highValue);
                        //   //-----------------------------------------------------------------
                        // }
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
              ModeWarning(),
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
