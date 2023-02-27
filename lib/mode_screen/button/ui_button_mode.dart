// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_null_comparison, prefer_if_null_operators
import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/mode_screen/time_widget.dart';
enum ButtonType { primaryBtn, secondaryBtn }
class UiButtonMode extends StatefulWidget {
  final Image icon;
  final String title;
  final String detail;
  final ButtonType buttonType;
  final Color? backgroundColor;
  final bool? isSmall;
  final double? width;
  final double? height;
  final bool? isDisable;
  final TextStyle? textStyle;
  final double? fontSize;
  final VoidCallback? onPress;
  final double? borderRadius;
  final Color? borderColor;
  final Color? colorTitle;
  final Color? colorDetail;
  final DateTime? expireDate;
  final String? mode;
  final bool? check;
  const UiButtonMode({
    Key? key,
    required this.icon,
    required this.title,
    required this.detail,
    required this.buttonType,
    this.expireDate,
    this.backgroundColor,
    this.onPress,
    this.width,
    this.height,
    this.textStyle,
    this.isDisable,
    this.isSmall,
    this.borderRadius,
    this.fontSize,
    this.borderColor,
    this.colorTitle,
    this.colorDetail,
    this.mode,
    this.check,
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
         ? BaseColorsLN.neutralsWhiteMixGrey
        : isPrimary == true
            ? widget.backgroundColor ?? BaseColorsLN.kellyGreen100
            : null;
    final Color borderColor = clickEnable == false
        ? BaseColorsLN.neutralsMediumGrey
        : widget.backgroundColor ?? BaseColorsLN.kellyGreen100;
    return InkWell(
      onTap: !clickEnable ? () {} : () => widget.onPress!(),
      child: Card(
          shape: RoundedRectangleBorder(
              // side: BorderSide(color: BaseColors.kellyGreen500),
              side: BorderSide(
                  color: widget.borderColor ?? BaseColorsLN.kellyGreen100,
                  width: 2),
              borderRadius: BorderRadius.circular(10.0)),
          color: backgroundColor,
          child: SizedBox(
              width: widget.isSmall != null && widget.isSmall == true
                  ? null
                  : widget.width ?? MediaQuery.of(context).size.width / 1.1,
              height: widget.isSmall != null && widget.isSmall == true
                  ? null
                  : widget.height ?? MediaQuery.of(context).size.height / 17.5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        widget.icon,
                        TimeWidget(
                          expire: widget.expireDate,
                          isFreeTrial: false,
                          mode: widget.mode,
                          check: widget.check,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      widget.title,
                      textAlign: TextAlign.left,
                      style: widget.textStyle ??
                          TextStyle(
                            color: widget.colorTitle != null
                                ? widget.colorTitle
                                : Colors.black,
                            fontSize: widget.fontSize ?? 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.detail,
                      style: widget.textStyle ??
                          TextStyle(
                            height: 0.5,
                            color: widget.colorDetail != null
                                ? widget.colorDetail
                                : BaseColorsLN.kellyGreen500,
                            fontSize: widget.fontSize ?? 18,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              ))),
    );
  }
}