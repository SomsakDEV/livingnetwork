import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/component/mode/button.dart';

class BottomSheetDecisionCardDialogMode extends StatefulWidget {
  final String title;
  final String desc;
  final String? imagePath;
  final bool? isDisable;
  final String textSubmitBtn;
  final String textCancelBtn;
  final bool? hasBorderCancelBtn;
  final Function(bool) onPressedSubmit;
  final Function(bool) onPressedCancel;

  const BottomSheetDecisionCardDialogMode(
      {Key? key,
      required this.title,
      required this.desc,
      required this.textSubmitBtn,
      required this.textCancelBtn,
      required this.onPressedSubmit,
      required this.onPressedCancel,
      this.imagePath,
      this.isDisable,
      this.hasBorderCancelBtn})
      : super(key: key);

  @override
  State<BottomSheetDecisionCardDialogMode> createState() =>
      _BottomSheetDecisionCardDialogModeState();
}

class _BottomSheetDecisionCardDialogModeState
    extends State<BottomSheetDecisionCardDialogMode> {
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
                            padding: const EdgeInsets.all(16),
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
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      widget.title,
                      style: LNStyle.buttonSheetTitle,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, top: 8, right: 16.0, bottom: 40),
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: LNStyle.buttonSheetDesc,
                    ),
                  ),
                  // Container(
                  //   child: widget.imagePath == null
                  //       ? const SizedBox(height: 45)
                  //       : Padding(
                  //           padding:
                  //               const EdgeInsets.only(top: 24.0, bottom: 33),
                  //           child: Image.asset(
                  //             widget.imagePath!,
                  //             fit: BoxFit.fill,
                  //             height: 72,
                  //             width: 72,
                  //           ),
                  //         ),
                  // ),
                  Button(
                    title: widget.textSubmitBtn,
                    backgroundColor: LNColor.kellyGreen500,
                    buttonType: ButtonType.primaryBtn,
                    onPress: () => widget.onPressedSubmit(true),
                    isDisable: widget.isDisable ?? false,
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
