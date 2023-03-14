// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_null_comparison, prefer_if_null_operators
import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/component/mode/time_widget.dart';

enum ButtonType { primaryBtn, secondaryBtn, empty}
class ButtonMode extends StatefulWidget {
  final Image icon;
  final String title;
  final String detail;
  final ButtonType buttonType;
  final Color? backgroundColor;
  final bool? isSmall;
  final double? width;
  final double? height;
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
  final bool isDisable;
  final bool isMode;
  final Function? setMode;

  const ButtonMode({
    Key? key,
    required this.icon,
    required this.title,
    required this.detail,
    required this.buttonType,
    required this.isDisable,
    required this.isMode,
    this.setMode,
    this.expireDate,
    this.backgroundColor,
    this.onPress,
    this.width,
    this.height,
    this.textStyle,
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
  State<ButtonMode> createState() => _ButtonModeState();
}
class _ButtonModeState extends State<ButtonMode> {
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
        ? LNColor.neutralsWhiteMixGrey
        : isPrimary == true
            ? widget.isDisable
        ? const Color(0xFFFAFAFA)
        : const Color(0xFFEEF8E8) ?? LNColor.kellyGreen100
            : null;
    final Color borderColor = clickEnable == false
        ? LNColor.neutralsMediumGrey
        : widget.backgroundColor ?? LNColor.kellyGreen100;
    return InkWell(
      onTap: !clickEnable ? () {} : () => widget.onPress!(),
      child: Card(
          shape: RoundedRectangleBorder(
              // side: BorderSide(color: BaseColors.kellyGreen500),
              side: BorderSide(
                  color: widget.isDisable
                      ? const Color(0xFFFAFAFA)
                      : widget.isMode
                      ? const Color(0xFF64CA00)
                      : const Color(0xFFEEF8E8) ?? LNColor.kellyGreen100,
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
                          setMode: widget.setMode,
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
                            fontFamily: 'DB Heavent',
                            color: widget.isDisable
                                ? const Color(0xFF7B8E98)
                                : const Color(0xFF38454C),
                            fontSize: widget.fontSize ?? 12,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            leadingDistribution: TextLeadingDistribution.even,
                            height: 1,
                          ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      widget.detail,
                      style: widget.textStyle ??
                          TextStyle(
                            fontFamily: 'DB Heavent',
                            color: widget.isDisable
                                ? const Color(0xFFB0BEC5)
                                : const Color(0xFF9EDE3E),
                            fontSize: widget.fontSize ?? 12,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.normal,
                            leadingDistribution: TextLeadingDistribution.even,
                            height: 1,
                          ),
                    ),
                  ],
                ),
              ))),
    );
  }
}