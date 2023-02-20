// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unnecessary_null_comparison, prefer_if_null_operators

import 'package:flutter/material.dart';
import 'package:living_network/mode_screen/time_widget.dart';
import 'package:ui_style/ui_style.dart';

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
        ? //BaseColors.neutralsMediumGrey
        Color(0xFFFAFAFA)
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
            // side: BorderSide(color: BaseColors.kellyGreen500),
            side: BorderSide(
                color: widget.borderColor ?? BaseColors.kellyGreen100,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
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
                        Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              gradient: LinearGradient(
                                  begin: FractionalOffset.centerLeft,
                                  end: FractionalOffset.centerRight,
                                  colors: const [
                                    Color(0xFF9EDE3E),
                                    Color(0xFF64CA00)
                                  ])),
                          width: 68,
                          height: 24,
                          child: Row(children: [
                            SizedBox(
                              width: 4.33,
                            ),
                            Image.asset(
                              'packages/living_network/assets/images/Vector.png',
                              width: 11.44,
                              height: 13,
                            ),
                            SizedBox(
                              width: 4.23,
                            ),
                            TimeWidget(
                              expire: widget.expireDate,
                            )
                          ]),
                        )
                      ],
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
                            fontWeight: FontWeight.normal,
                          ),
                    ),
                    Text(
                      widget.detail,
                      style: widget.textStyle ??
                          TextStyle(
                            height: 0.5,
                            color: widget.colorDetail != null
                                ? widget.colorDetail
                                : BaseColors.kellyGreen500,
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
