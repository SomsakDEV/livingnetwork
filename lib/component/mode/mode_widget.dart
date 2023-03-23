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
import 'package:shared_preferences/shared_preferences.dart';
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
  final Future<SharedPreferences> _mode = SharedPreferences.getInstance();
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

  void waitUpdate(InternalProvider data) {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return FutureBuilder(
              future: data.updateMode5G(
                  data.mode?.modeUpdate, data.mode?.checkModeProfile),
              builder: (context, snap) {
                if (snap.hasData) {
                  Navigator.pop(context);
                  return Container();
                } else {
                  return Dialog(
                    backgroundColor: LNColor.transparent,
                    child: Image.asset('assets/piggy.gif'),
                  );
                }
              });
        }));
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
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            ImageUtils.getImagePath(
                                'assets/images/mode_title.png'),
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
                              (data.mode?.isDisableMode ?? false)
                                  // ||
                                  //     (data.displayScreen?.mode?.isDisableModeLive ??
                                  //         false)
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
                            isMode: data.mode?.mode == 'boost_mode',
                            isDisable: (data.mode?.isDisableMode ?? false)
                            // ||
                            // (data.displayScreen?.mode?.isDisableModeLive ??
                            //     false)
                            ,
                            expireDate: data.mode?.mode == 'boost_mode'
                                ? data.mode?.expireMode
                                : null,
                            mode: 'modeLiveTime',
                            setMode: waitUpdate,
                            check: data.mode?.mode == 'boost_mode',
                            onPress: () {
                              if (!(data.mode?.mode == 'boost_mode')) {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled:true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return BottomSheetDecisionPaymentCardDialogMode(
                                      title: titlePaymentL,
                                      desc: descPaymentL,
                                      priceTime: priceTimeL,
                                      vat: vatL,
                                      termsConditionsTitle: termsConditionsTitleL,
                                      termsConditionsDesc: termsConditionsDescL,
                                      textSubmitBtn: 'Confirm',
                                      textCancelBtn: 'Close',
                                      onPressedSubmit: (isClicked) async {
                                        Navigator.pop(context);
                                        data.mode?.modeUpdate?.mode5G
                                            .lastDefaultMode = data
                                                .mode
                                                ?.modeUpdate
                                                ?.mode5G
                                                .currentMode
                                                .modeName ??
                                            'max_mode';
                                        data
                                            .mode
                                            ?.modeUpdate
                                            ?.mode5G
                                            .currentMode
                                            .modeName = 'boost_mode';
                                        data.mode?.modeUpdate?.mode5G
                                                .currentMode.expireDate =
                                            DateTime.now()
                                                .add(const Duration(hours: 1))
                                                .toString();
                                        data.mode?.modeUpdate?.mode5G
                                            .changeModePerDay.count++;
                                        waitUpdate(data);
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
                                      title: 'Exit From Power/Boost mode?',
                                      desc:
                                          'Detail: exit from power/boost mode',
                                      textSubmitBtn: 'Exit',
                                      textCancelBtn: 'Close',
                                      onPressedSubmit: (isClicked) {
                                        Navigator.pop(context);
                                        data.mode?.modeUpdate?.mode5G
                                            .lastDefaultMode = data
                                                .mode
                                                ?.modeUpdate
                                                ?.mode5G
                                                .currentMode
                                                .modeName ??
                                            'max_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.modeName = 'max_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.expireDate = '';
                                        data.mode?.modeUpdate?.mode5G
                                            .changeModePerDay.count++;
                                        waitUpdate(data);
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
                              (data.mode?.isDisableMode ?? false)
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
                            title: 'Game Mode',
                            detail: 'Server is currently full',
                            buttonType: button.ButtonType.primaryBtn,
                            height: 70,
                            width: 143,
                            borderRadius: 10,
                            isMode: data.mode?.mode == 'game_mode',
                            isDisable: (data.mode?.isDisableMode ?? false)
                            // ||
                            // (data.displayScreen?.mode?.isDisableModeGame ??
                            //     false)
                            ,
                            expireDate: data.mode?.mode == 'game_mode'
                                ? data.mode?.expireMode
                                : null,
                            mode: 'modeGameTime',
                            setMode: waitUpdate,
                            check: data.mode?.mode == 'game_mode',
                            onPress: () {
                              if (!(data.mode?.mode == 'game_mode')) {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled:true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return BottomSheetDecisionPaymentCardDialogMode(
                                      // title: 'Switch to Game mode?',
                                      // desc:
                                      //     'เล่นฟรีได้ 30 นาที ใช้ได้ 1 ครั้ง \n ถ้าออกก่อนก็จะหมดสิทธิแล้ว...',
                                      title: titlePaymentG,
                                      desc: descPaymentG,
                                      priceTime: priceTimeG,
                                      vat: vatG,
                                      termsConditionsTitle: termsConditionsTitleG,
                                      termsConditionsDesc: termsConditionsDescG,
                                      textSubmitBtn: 'Confirm',
                                      textCancelBtn: 'Close',
                                      onPressedSubmit: (isClicked) {
                                        Navigator.pop(context);
                                        data.mode?.modeUpdate?.mode5G
                                            .lastDefaultMode = data
                                                .mode
                                                ?.modeUpdate
                                                ?.mode5G
                                                .currentMode
                                                .modeName ??
                                            'max_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.modeName = 'game_mode';
                                        data.mode?.modeUpdate?.mode5G
                                                .currentMode.expireDate =
                                            DateTime.now()
                                                .add(
                                                    const Duration(seconds: 10))
                                                .toString();
                                        data.mode?.modeUpdate?.mode5G
                                            .changeModePerDay.count++;
                                        waitUpdate(data);
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
                                      title: 'Exit From Game mode?',
                                      desc: 'Detail: exit from game mode',
                                      textSubmitBtn: 'Exit',
                                      textCancelBtn: 'Close',
                                      onPressedSubmit: (isClicked) {
                                        Navigator.pop(context);
                                        data.mode?.modeUpdate?.mode5G
                                            .lastDefaultMode = data
                                                .mode
                                                ?.modeUpdate
                                                ?.mode5G
                                                .currentMode
                                                .modeName ??
                                            'max_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.modeName = 'max_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.expireDate = '';
                                        data.mode?.modeUpdate?.mode5G
                                            .changeModePerDay.count++;
                                        waitUpdate(data);
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
                              (data.mode?.isDisableMode ?? false)
                                  // ||
                                  //     (data.displayScreen?.mode?.isDisableModeEco ??
                                  //         false)
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
                            isMode: data.mode?.mode == 'eco_mode',
                            isDisable: (data.mode?.isDisableMode ?? false)
                            // ||
                            // (data.displayScreen?.mode?.isDisableModeEco ?? false)
                            ,
                            onPress: () {
                              if (!(data.mode?.mode == 'eco_mode')) {
                                showModalBottomSheet(
                                  isDismissible: false,
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return BottomSheetDecisionCardDialogMode(
                                      title: 'Switch to Eco mode?',
                                      desc: 'Detail: save battery',
                                      textSubmitBtn: 'Switch to Eco mode',
                                      textCancelBtn: 'Close',
                                      onPressedSubmit: (isClicked) async {
                                        Navigator.pop(context);
                                        data.mode?.modeUpdate?.mode5G
                                            .lastDefaultMode = data
                                                .mode
                                                ?.modeUpdate
                                                ?.mode5G
                                                .currentMode
                                                .modeName ??
                                            'max_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.modeName = 'eco_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.expireDate = '';
                                        data.mode?.modeUpdate?.mode5G
                                            .changeModePerDay.count++;
                                        waitUpdate(data);
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
                                      title: 'Exit From Eco mode?',
                                      desc: 'Detail: exit from eco mode',
                                      textSubmitBtn: 'Exit',
                                      textCancelBtn: 'Close',
                                      exitMode: true,
                                      onPressedSubmit: (isClicked) async {
                                        Navigator.pop(context);
                                        data.mode?.modeUpdate?.mode5G
                                            .lastDefaultMode = data
                                                .mode
                                                ?.modeUpdate
                                                ?.mode5G
                                                .currentMode
                                                .modeName ??
                                            'max_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.modeName = 'max_mode';
                                        data.mode?.modeUpdate?.mode5G
                                            .currentMode.expireDate = '';
                                        waitUpdate(data);
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
            ));
  }
}
