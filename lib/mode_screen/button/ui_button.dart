// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_style/ui_style.dart';

enum ButtonType { primaryBtn, secondaryBtn }

class UiButtonMode extends StatefulWidget {
  final Image icon;
  final String title;
  final String detail;
  final ButtonType buttonType;
  final Icon? prefixIcon;
  final Color? backgroundColor;
  final bool? isSmall;
  final double? width;
  final double? height;
  final bool? isDisable;
  final TextStyle? textStyle;
  final double? fontSize;
  final VoidCallback? onPress;
  final double? borderRadius;

  const UiButtonMode({
    Key? key,
    required this.icon,
    required this.title,
    required this.detail,
    required this.buttonType,
    this.backgroundColor,
    this.onPress,
    this.width,
    this.height,
    this.textStyle,
    this.isDisable,
    this.isSmall,
    this.borderRadius,
    this.fontSize,
    this.prefixIcon,
  }) : super(key: key);

  @override
  State<UiButtonMode> createState() => _UiButtonModeState();
}

class _UiButtonModeState extends State<UiButtonMode> {
  @override
  Widget build(BuildContext context) {
    bool clickEnable = true;
    bool isPrimary = true;

    if (widget.isDisable != null && widget.isDisable == true) {
      clickEnable = !clickEnable;
    }

    if (widget.buttonType == ButtonType.secondaryBtn) {
      isPrimary = !isPrimary;
    }

    final Color? backgroundColor = isPrimary == true && clickEnable == false
        ? BaseColors.neutralsMediumGrey
        : isPrimary == true
            ? widget.backgroundColor ?? BaseColors.kellyGreen100
            : null;

    final Color borderColor = clickEnable == false
        ? BaseColors.neutralsMediumGrey
        : widget.backgroundColor ?? BaseColors.kellyGreen100;

    return InkWell(
      onTap: !clickEnable ? () {} : () => widget.onPress!(),
      child: Card(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: BaseColors.kellyGreen500),
            borderRadius: BorderRadius.circular(10.0)),
        color: backgroundColor,
        child: SizedBox(
          width: widget.isSmall != null && widget.isSmall == true
              ? null
              : widget.width ?? MediaQuery.of(context).size.width / 1.1,
          height: widget.isSmall != null && widget.isSmall == true
              ? null
              : widget.height ?? MediaQuery.of(context).size.height / 17.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.prefixIcon ?? const SizedBox(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        widget.icon,
                      ],
                    ),
                    Text(
                      widget.title,
                      textAlign: TextAlign.left,
                      style: widget.textStyle ??
                          TextStyle(
                            color: Colors.black,
                            fontSize: widget.fontSize ?? 18,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      widget.detail,
                      style: widget.textStyle ??
                          TextStyle(
                            height: 0.5,
                            color: BaseColors.kellyGreen500,
                            fontSize: widget.fontSize ?? 18,
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                  ],
                ),
              ),
              //widget.suffixIcon ?? const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
