import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/component/mode/button.dart';

class BottomSheetDecisionCardDialogMode extends StatefulWidget {
  final String title;
  final String? desc;
  final String? imagePath;
  final bool? isDisable;
  final bool? exitMode;
  final String textSubmitBtn;
  final String textCancelBtn;
  final bool? hasBorderCancelBtn;
  final Function(bool) onPressedSubmit;
  final Function(bool) onPressedCancel;

  const BottomSheetDecisionCardDialogMode(
      {Key? key,
      required this.title,
      this.desc,
      required this.textSubmitBtn,
      required this.textCancelBtn,
      required this.onPressedSubmit,
      required this.onPressedCancel,
      this.imagePath,
      this.isDisable,
      this.exitMode,
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
                bottom: MediaQuery.of(context).size.height * 0.053,
              ),
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
                              style: widget.exitMode ?? false
                                  ? LNStyle.buttonSheetTextButtonCloseExit
                                  : LNStyle.buttonSheetTextButtonCloseAdd,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.title,
                    style: widget.exitMode ?? false
                        ? LNStyle.buttonSheetTitleExit
                        : LNStyle.buttonSheetTitleAdd,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 40, left: 10, right: 10),
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.desc?? 'description',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: LNStyle.buttonSheetDesc,
                    ),
                  ),
                  Button(
                    title: widget.textSubmitBtn,
                    backgroundColor: widget.exitMode ?? false
                        ? LNColor.speedCompare1
                        : LNColor.kellyGreen500,
                    buttonType: ButtonType.primaryBtn,
                    onPress: () => widget.onPressedSubmit(true),
                    isDisable: widget.isDisable ?? false,
                    height: 54,
                    width: MediaQuery.of(context).size.width * 0.9,
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
