import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/component/mode/button.dart';
import 'package:living_network/constance/constants.dart';

class BottomSheetDecisionPaymentCardDialogMode extends StatefulWidget {
  // final String title;
  // final String desc;
  // final String priceTime;
  // final String vat;
  // final String termsConditionsTitle;
  // final String termsConditionsDesc;
  final String? imagePath;
  final String textSubmitBtn;
  final String textCancelBtn;
  final bool? hasBorderCancelBtn;
  final Function(bool) onPressedSubmit;
  final Function(bool) onPressedCancel;

  const BottomSheetDecisionPaymentCardDialogMode(
      {Key? key,
      // required this.title,
      // required this.desc,
      // required this.priceTime,
      // required this.vat,
      // required this.termsConditionsTitle,
      // required this.termsConditionsDesc,
      required this.textSubmitBtn,
      required this.textCancelBtn,
      required this.onPressedSubmit,
      required this.onPressedCancel,
      this.imagePath,
      this.hasBorderCancelBtn})
      : super(key: key);

  @override
  State<BottomSheetDecisionPaymentCardDialogMode> createState() =>
      _BottomSheetDecisionPaymentCardDialogModeState();
}

class _BottomSheetDecisionPaymentCardDialogModeState
    extends State<BottomSheetDecisionPaymentCardDialogMode> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Wrap(
        children: [
          Container(
            // height: widget.imagePath == null ? 386 : 455,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: 16.0,
                  bottom: MediaQuery.of(context).size.height * 0.053,
                  left: 16.0,
                  right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            widget.onPressedCancel(true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              widget.textCancelBtn,
                              style: LNStyle.buttonSheetTextButtonClose,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.64, right: 16.64),
                    child: Text(
                      titlePayment,
                      style: LNStyle.buttonSheetTitle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, top: 8, right: 16.0, bottom: 8),
                    child: Text(
                      textAlign: TextAlign.center,
                      descPayment,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: LNStyle.buttonSheetDesc,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 95.5, right: 95.5, bottom: 8),
                    child: Text(
                      priceTime,
                      style: LNStyle.buttonSheetPriceTime,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 130.5, right: 130.5, bottom: 16),
                    child: Container(
                      color: LNColor.whiteSpeedCompare,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4, right: 4),
                        child: Text(
                          vat,
                          style: LNStyle.buttonSheetVat,
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       left: 16, right: 16, bottom: 8, top: 20),
                  //   child: Text(
                  //     termsConditionsTitle,
                  //     style: LNStyle.buttonSheetTermTitle,
                  //   ),
                  // ),

                  Center(
                    child: Container(
                      // margin: EdgeInsets.only(left: 40, right: 40),
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      height: 140,
                      child: Scrollbar(
                        thickness: 8,
                        isAlwaysShown: true,
                        showTrackOnHover: true,
                        scrollbarOrientation: ScrollbarOrientation.right,
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  termsConditionsTitle,
                                  style: LNStyle.buttonSheetTermTitle,
                                ),
                                Text(
                                  termsConditionsDesc,
                                  style: LNStyle.buttonSheetTermDesc,
                                  // maxLines: 3,
                                  // overflow: TextOverflow.visible,
                                ),
                              ],
                            )),
                      ),
                    ),
                  ),
                  Button(
                    title: widget.textSubmitBtn,
                    backgroundColor: LNColor.kellyGreen500,
                    buttonType: ButtonType.primaryBtn,
                    onPress: () => widget.onPressedSubmit(true),
                    height: 54,
                    borderRadius: 8,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
