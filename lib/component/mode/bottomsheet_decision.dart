import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/component/mode/button.dart';

class BottomSheetCardDialogMode extends StatefulWidget {
  final String title;
  final String desc;
  final String? imagePath;
  final String textSubmitBtn;
  final String textCancelBtn;
  final bool? hasBorderCancelBtn;
  final Function(bool) onPressedSubmit;
  final Function(bool) onPressedCancel;

  const BottomSheetCardDialogMode(
      {Key? key,
      required this.title,
      required this.desc,
      required this.textSubmitBtn,
      required this.textCancelBtn,
      required this.onPressedSubmit,
      required this.onPressedCancel,
      this.imagePath,
      this.hasBorderCancelBtn})
      : super(key: key);

  @override
  State<BottomSheetCardDialogMode> createState() =>
      _BottomSheetCardDialogModeState();
}

class _BottomSheetCardDialogModeState
    extends State<BottomSheetCardDialogMode> {
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
                          child: Text(
                            widget.textCancelBtn,
                            style: LNStyle.buttonSheetTextButtonClose,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    widget.title,
                    style: LNStyle.buttonSheetTitle,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, top: 8, right: 18.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: LNStyle.buttonSheetDesc,
                    ),
                  ),
                  Container(
                    child: widget.imagePath == null
                        ? const SizedBox(height: 45)
                        : Padding(
                            padding:
                                const EdgeInsets.only(top: 24.0, bottom: 33),
                            child: Image.asset(
                              widget.imagePath!,
                              fit: BoxFit.fill,
                              height: 72,
                              width: 72,
                            ),
                          ),
                  ),
                  Button(
                    title: widget.textSubmitBtn,
                    backgroundColor: BaseColorsLN.kellyGreen500,
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
