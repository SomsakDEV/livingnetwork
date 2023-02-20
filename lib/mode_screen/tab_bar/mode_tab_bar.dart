// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ui_style/ui_style.dart' as ui;

class ModeTagBar extends StatefulWidget {
  //const ModeTagBar({super.key});

  // final String labelText;
  final List<LinearMarkerPointer>? markerPointers;
  final Color? textColor;
  final double maxValue;
  final double markerValue;
  final List<Color>? barColorGradient;
  final LinearEdgeStyle? barPointerEdgeStyle;

  const ModeTagBar({
    // required this.labelText,
    required this.maxValue,
    required this.markerValue,
    this.markerPointers,
    this.textColor,
    this.barColorGradient,
    this.barPointerEdgeStyle,
    super.key,
  });

  @override
  State<ModeTagBar> createState() => _ModeTagBarState();
}

class _ModeTagBarState extends State<ModeTagBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*SizedBox(
            width: 100,
            child: Text(
              widget.labelText,
              style: TextStyle(
                fontFamily: 'DB Heavent',
                // fontFamilyFallback: ['NotoSansThaiUI'],
                color: Color(0xFF38454C),
                fontSize: 18,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                leadingDistribution: TextLeadingDistribution.even,
                height: 1.3,
                //letterSpacing: -0.4
              ),
            ),
          ),*/
          // const SizedBox(width: 5,),
          Expanded(
            child: SfLinearGauge(
                animationDuration: 1000,
                animateRange: true,
                maximum: widget.maxValue,
                //Style bar
                showTicks: false,
                showLabels: false,
                axisTrackStyle: const LinearAxisTrackStyle(
                  thickness: 10,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  color: ui.BaseColors.neutralsLightestGrey,
                ),
                //Value
                barPointers: [
                  LinearBarPointer(
                    value: widget.markerValue,
                    thickness: 10,
                    edgeStyle:
                        widget.barPointerEdgeStyle ?? LinearEdgeStyle.bothCurve,
                    shaderCallback: shader,
                  ),
                ],
                markerPointers: widget.markerPointers),
          ),
        ],
      ),
    );
  }

  Shader shader(Rect bounds) {
    return LinearGradient(
        colors: widget.barColorGradient ??
            [
              BaseColorsLN.speedCompare2,
              BaseColorsLN.speedCompare2,
            ],
        stops: const [0, 0.3]).createShader(bounds);
  }
}
