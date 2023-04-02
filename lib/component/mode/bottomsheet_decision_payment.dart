import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/component/mode/button.dart';
import 'package:living_network/constance/constants.dart';

class BottomSheetDecisionPaymentCardDialogMode extends StatefulWidget {
  final String title;
  final String? imagePath;
  final String textSubmitBtn;
  final String textCancelBtn;
  final bool? hasBorderCancelBtn;
  final bool? isHighValue;
  final Function(bool) onPressedSubmit;
  final Function(bool) onPressedCancel;

  const BottomSheetDecisionPaymentCardDialogMode({Key? key, required this.title, required this.textSubmitBtn, required this.textCancelBtn, required this.onPressedSubmit, required this.onPressedCancel, this.isHighValue, this.imagePath, this.hasBorderCancelBtn}) : super(key: key);

  @override
  State<BottomSheetDecisionPaymentCardDialogMode> createState() => _BottomSheetDecisionPaymentCardDialogModeState();
}

class _BottomSheetDecisionPaymentCardDialogModeState extends State<BottomSheetDecisionPaymentCardDialogMode> {
  Widget? termConditionDesc() {
    Map<String, dynamic> desc = termsConditionsDesc;
    final scrollController = ScrollController();
    return ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: desc.length,
      itemBuilder: (context, index) {
        int s = index + 1;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                flex: 1,
                child: Text(
                  "${s.toString()}.",
                  textAlign: TextAlign.center,
                  style: LNStyle.buttonSheetTermDesc,
                )),
            Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Text(
                    desc["$s"].toString(),
                    style: LNStyle.buttonSheetTermDesc,
                  ),
                ))
          ],
        );
      },
    );
  }

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
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.053, left: 16.0, right: 16.0),
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
                              style: LNStyle.buttonSheetTextButtonCloseAdd,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        widget.title,
                        style: LNStyle.buttonSheetTitlePayment,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      child: Text(
                        textAlign: TextAlign.center,
                        descPayment,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: LNStyle.buttonSheetDescPayment,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          (widget.isHighValue?? false ? priceHigh : priceNotHigh),
                          style: LNStyle.buttonSheetPriceTime,
                        ),
                        Text(
                          separate,
                          style: LNStyle.buttonSheetSeparate,
                        ),
                        Text(
                          time,
                          style: LNStyle.buttonSheetPriceTime,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Container(
                      color: LNColor.whiteSpeedCompare,
                      child: SizedBox(
                        height: 4,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.only(top: 16, bottom: 16, left: 15, right: 5),
                        width: MediaQuery.of(context).size.width * 0.90,
                        height: 140,
                        child: Scrollbar(
                          thickness: 5,
                          thumbVisibility: true,
                          trackVisibility: true,
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
                                Container(child: termConditionDesc()),
                              ],
                            ),

                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.start,
                            //   children: [
                            //     Text(
                            //       widget.termsConditionsTitle,
                            //       style: LNStyle.buttonSheetTermTitle,
                            //     ),
                            // Text(
                            //   widget.termsConditionsDesc,
                            //   style: LNStyle.buttonSheetTermDesc,
                            //   // maxLines: 3,
                            //   // overflow: TextOverflow.visible,
                            // ),
                            // ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // ),
                  Button(
                    title: widget.textSubmitBtn,
                    backgroundColor: LNColor.kellyGreen500,
                    buttonType: ButtonType.primaryBtn,
                    onPress: () => widget.onPressedSubmit(true),
                    width: MediaQuery.of(context).size.width * 0.9,
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
