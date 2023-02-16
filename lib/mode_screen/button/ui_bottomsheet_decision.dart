import 'package:ui_style/ui_style.dart';
import 'package:flutter/material.dart';

class UiBottomSheetCardDialogMode extends StatefulWidget {
  final String title;
  final String desc;
  final String? imagePath;
  final String textSubmitBtn;
  final bool? hasBorderCancelBtn;
  final Function(bool) onPressedSubmit;
  final Function(bool) onPressedCancel;

  const UiBottomSheetCardDialogMode(
      {Key? key,
      required this.title,
      required this.desc,
      required this.textSubmitBtn,
      required this.onPressedSubmit,
      required this.onPressedCancel,
      this.imagePath,
      this.hasBorderCancelBtn})
      : super(key: key);

  @override
  State<UiBottomSheetCardDialogMode> createState() =>
      _UiBottomSheetCardDialogModeState();
}

class _UiBottomSheetCardDialogModeState
    extends State<UiBottomSheetCardDialogMode> {
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
                  top: 50.0,
                  bottom: MediaQuery.of(context).size.height * 0.053,
                  left: 16.0,
                  right: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: BaseColors.kellyGreen500,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 18.0, top: 8, right: 18.0),
                    child: Text(
                      textAlign: TextAlign.center,
                      widget.desc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
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
                  UiButton(
                    title: widget.textSubmitBtn,
                    backgroundColor: BaseColors.kellyGreen500,
                    buttonType: ButtonType.primaryBtn,
                    onPress: () => widget.onPressedSubmit(true),
                    height: 58,
                    borderRadius: 30,
                    fontSize: 24,
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
