import 'dart:async';

import 'package:flutter/material.dart';
import 'package:living_network/component/mode/bottomsheet_decision.dart';
import 'package:living_network/component/mode/bottomsheet_text.dart';
import 'package:living_network/component/notification/mode_5G_default.dart';
import 'package:living_network/component/notification/mode_warning.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/constance/constants.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';
import 'package:living_network/component/mode/button_mode.dart' as button;

import 'bottomsheet_decision_payment.dart';

bool timeout = false;

class ModeWidget extends StatefulWidget {
  ModeWidget({
    super.key,
  });

  @override
  State<ModeWidget> createState() => _ModeWidgetState();
}

class _ModeWidgetState extends State<ModeWidget> {
  final SizedBox _sizedBox = const SizedBox(
    height: 8,
  );

  String? mode;
  DateTime? expireLiveMode;
  DateTime? expireGameMode;

  bool isMode(String value) {
    return value == mode;
  }

  late bool errorMessage = true;
  late bool defaultMessage = true;

  late bool isDisableButtonSheet = false;
  late bool exitMode = false;

  SnackBar snackBarSuccess(BuildContext context, {String message = 'default'}) {
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
              child: Image.asset('assets/images/checkmark.png'),
            ),
            message == 'boost'
                ? Text(boostSuccess)
                : message == 'game'
                    ? Text(gameSuccess)
                    : message == 'eco'
                        ? Text(ecoSuccess)
                        : const Text('Switched success!'),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Future<bool> isDisable(bool value) async {
    return value;
  }

  Future<void> setIsDisable(LnProvider ss, bool value) async {
    ss.setIsDisable(value);
  }

  Future<void> wUpdate(InternalProvider data,bool addSocket, String mode,
      {String loadingGif = 'default', String add = 'default'}) async {
    String img = loadingGif == 'game'
        ? 'assets/loading_game_mode.gif'
        : 'assets/piggy.gif';
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return FutureBuilder(
                future: addSocket
                    ? data.getAddMode(mode)
                    : data.getDeleteMode(mode),
                // data.updateMode5G(
                //     data.mode?.modeUpdate, data.mode?.checkModeProfile),
                builder: (context, snap) {
                  if (snap.hasData) {
                    Navigator.pop(context);
                    if (add == 'delete') {
                      return Container();
                    } else {
                      Timer(
                        const Duration(milliseconds: 100),
                        () => ScaffoldMessenger.of(context).showSnackBar(
                            snackBarSuccess(context, message: add)),
                      );
                      return Container();
                    }
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
                        ImageUtils.getImagePath(
                            'assets/images/exclamation_green2.png'),
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
                        (data.mode5G?.isDisableMode ?? false)
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_power_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_power.png'),
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
                      isDisable: (data.mode5G?.isDisableMode ?? false),
                      expireDate: data.mode5G?.mode == 'boost_mode'
                          ? data.mode5G?.expireMode
                          : null,
                      mode: 'modeLiveTime',
                      setMode: wUpdate,
                      check: data.mode5G?.mode == 'boost_mode',
                      onPress: () {
                        if (!(data.mode5G?.mode == 'boost_mode')) {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetDecisionPaymentCardDialogMode(
                                title: titlePaymentL,
                                desc: descPaymentL,
                                price: priceL,
                                seperate: seperateL,
                                time: timeL,
                                vat: vatL,
                                termsConditionsTitle: termsConditionsTitle,
                                termsConditionsDesc: '',
                                textSubmitBtn: textSubmitBtn,
                                textCancelBtn: textCancelBtn,
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  data.mode5G?.modeUpdate?.mode5G
                                      .lastDefaultMode = data.mode5G?.modeUpdate
                                          ?.mode5G.currentMode.modeName ??
                                      'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .modeName = 'boost_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                          .expireDate =
                                      DateTime.now()
                                          .add(const Duration(minutes: 5))
                                          .toString();
                                  data.mode5G?.modeUpdate?.mode5G.changeModePerDay
                                      .count++;
                                  wUpdate(data, true, 'boost_mode',
                                      add: 'boost');
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
                              return BottomSheetDecisionCardDialogMode(
                                title: btmSheetTitlePower,
                                desc: btmSheetDescPower,
                                textSubmitBtn: textSubmitBtn,
                                textCancelBtn: textCancelBtn,
                                exitMode: true,
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  data.mode5G?.modeUpdate?.mode5G
                                      .lastDefaultMode = data.mode5G?.modeUpdate
                                          ?.mode5G.currentMode.modeName ??
                                      'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .modeName = 'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .expireDate = '';
                                  data.mode5G?.modeUpdate?.mode5G.changeModePerDay
                                      .count++;
                                  wUpdate(data, false, 'boost_mode',
                                      add: 'delete');
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
                        (data.mode5G?.isDisableMode ?? false)
                            // ||
                            //     (data.displayScreen?.mode?.isDisableModeGame ??
                            //         false)
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_game_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_game.png'),
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
                      isDisable: (data.mode5G?.isDisableMode ?? false),
                      expireDate: data.mode5G?.mode == 'game_mode'
                          ? data.mode5G?.expireMode
                          : null,
                      mode: 'modeGameTime',
                      setMode: wUpdate,
                      check: data.mode5G?.mode == 'game_mode',
                      onPress: () {
                        if (!(data.mode5G?.mode == 'game_mode')) {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetDecisionPaymentCardDialogMode(
                                title: titlePaymentG,
                                desc: descPaymentG,
                                price: priceG,
                                seperate: seperateG,
                                time: timeG,
                                vat: vatG,
                                termsConditionsTitle: termsConditionsTitle,
                                termsConditionsDesc: "termsConditionsDescG",
                                textSubmitBtn: textSubmitBtn,
                                textCancelBtn: textCancelBtn,
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  data.mode5G?.modeUpdate?.mode5G
                                      .lastDefaultMode = data.mode5G?.modeUpdate
                                          ?.mode5G.currentMode.modeName ??
                                      'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .modeName = 'game_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                          .expireDate =
                                      DateTime.now()
                                          .add(const Duration(minutes: 5))
                                          .toString();
                                  data.mode5G?.modeUpdate?.mode5G.changeModePerDay
                                      .count++;
                                  wUpdate(data, true, 'game_mode',
                                      loadingGif: 'game', add: 'game');
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
                              return BottomSheetDecisionCardDialogMode(
                                title: btmSheetTitleGame,
                                desc: btmSheetDescGame,
                                textSubmitBtn: textSubmitBtn,
                                textCancelBtn: textCancelBtn,
                                exitMode: true,
                                onPressedSubmit: (isClicked) {
                                  Navigator.pop(context);
                                  data.mode5G?.modeUpdate?.mode5G
                                      .lastDefaultMode = data.mode5G?.modeUpdate
                                          ?.mode5G.currentMode.modeName ??
                                      'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .modeName = 'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .expireDate = '';
                                  data.mode5G?.modeUpdate?.mode5G.changeModePerDay
                                      .count++;
                                  wUpdate(data, false, 'game_mode',
                                      loadingGif: 'game', add: 'delete');
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
                        (data.mode5G?.isDisableMode ?? false)
                            ? ImageUtils.getImagePath(
                                'assets/images/mode_eco_bw.png')
                            : ImageUtils.getImagePath(
                                'assets/images/mode_eco.png'),
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
                      isDisable: (data.mode5G?.isDisableMode ?? false),
                      onPress: () {
                        if (!(data.mode5G?.mode == 'eco_mode')) {
                          showModalBottomSheet(
                            isDismissible: false,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return BottomSheetDecisionCardDialogMode(
                                title: titleEco,
                                desc: descEco,
                                textSubmitBtn: textSubmitEco,
                                textCancelBtn: textCancelBtn,
                                onPressedSubmit: (isClicked) async {
                                  Navigator.pop(context);
                                  data.mode5G?.modeUpdate?.mode5G
                                      .lastDefaultMode = data.mode5G?.modeUpdate
                                          ?.mode5G.currentMode.modeName ??
                                      'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .modeName = 'eco_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .expireDate = '';
                                  data.mode5G?.modeUpdate?.mode5G.changeModePerDay
                                      .count++;
                                  wUpdate(data, true, 'eco_mode',
                                      add: 'eco');
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
                              return BottomSheetDecisionCardDialogMode(
                                title: btmSheetTitleEco,
                                desc: btmSheetDescEco,
                                textSubmitBtn: textSubmitBtn,
                                textCancelBtn: textCancelBtn,
                                exitMode: true,
                                onPressedSubmit: (isClicked) async {
                                  Navigator.pop(context);
                                  data.mode5G?.modeUpdate?.mode5G
                                      .lastDefaultMode = data.mode5G?.modeUpdate
                                          ?.mode5G.currentMode.modeName ??
                                      'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .modeName = 'max_mode';
                                  data.mode5G?.modeUpdate?.mode5G.currentMode
                                      .expireDate = '';
                                  wUpdate(data, false, 'eco_mode',
                                      add: 'delete');
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
              defaultMessage
                  ? const Mode5GDefault()
                  : errorMessage
                      ? const ModeWarning(warningNumber: 2)
                      : const Mode5GDefault(),
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
