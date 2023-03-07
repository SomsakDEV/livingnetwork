import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';


enum ButtonType { primaryBtn, secondaryBtn }

class Button extends StatefulWidget {
  final String title;
  final ButtonType buttonType;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final Color? backgroundColor;
  final bool? isSmall;
  final double? width;
  final double? height;
  final bool? isDisable;
  final TextStyle? textStyle;
  final double? fontSize;
  final VoidCallback? onPress;
  final double? borderRadius;
  final FontWeight? fontWeight;

  const Button({
    Key? key,
    required this.title,
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
    this.suffixIcon,
    this.fontWeight,
  }) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
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
        ? BaseColorsLN.neutralsMediumGrey
        : isPrimary == true
        ? widget.backgroundColor ?? BaseColorsLN.kellyGreen500
        : null;

    final Color borderColor = clickEnable == false
        ? BaseColorsLN.neutralsMediumGrey
        : widget.backgroundColor ?? BaseColorsLN.kellyGreen500;

    return Container(
      margin: const EdgeInsets.only(bottom: 10, top: 5),
      child: SizedBox(
        width: widget.isSmall != null && widget.isSmall == true
            ? null
            : widget.width ?? MediaQuery.of(context).size.width / 1.1,
        height: widget.isSmall != null && widget.isSmall == true
            ? null
            : widget.height ?? MediaQuery.of(context).size.height / 17.5,
        child: TextButton(
          onPressed: !clickEnable ? () {} : () => widget.onPress!(),
          style: ElevatedButton.styleFrom(
            splashFactory: NoSplash.splashFactory,
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: widget.borderRadius == null
                  ? BorderRadius.circular(30)
                  : BorderRadius.circular(widget.borderRadius!),
              side: BorderSide(
                  color: borderColor,
                  width: 1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                widget.prefixIcon ?? const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3.0),
                  child: Text(
                    widget.title,
                    style: widget.textStyle ??
                        TextStyle(
                          color: isPrimary == true && clickEnable
                              ? BaseColorsLN.neutralsWhite
                              : !clickEnable
                              ? BaseColorsLN.musGreen900
                              : widget.backgroundColor ??
                              BaseColorsLN.kellyGreen500,
                          fontSize: widget.fontSize ?? 20,
                          fontWeight: widget.fontWeight ?? FontWeight.bold,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'DB Heavent',
                        ),
                  ),
                ),
                widget.suffixIcon ?? const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
