import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class IUWidget extends StatefulWidget {
  final List<LinearMarkerPointer>? markerPointers;
  final double maxValue;
  final double markerValue;
  final List<Color>? barColorGradient;
  final LinearEdgeStyle? barPointerEdgeStyle;
  final int? animationDuration;
  final double? thickness;
  final EdgeInsets? padding;
  final bool? animateRange;
  final double? topPadding;

  const IUWidget({
    required this.maxValue,
    required this.markerValue,
    this.markerPointers,
    this.barColorGradient,
    this.barPointerEdgeStyle,
    this.animationDuration,
    this.thickness,
    this.padding,
    this.animateRange,
    this.topPadding,
    super.key,
  });

  @override
  State<IUWidget> createState() => _IUWidgetState();
}

class _IUWidgetState extends State<IUWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.only(top: widget.topPadding?? 20, right: 10, bottom: 10),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SfLinearGauge(
                animateRange: widget.animateRange ?? true,
                animationDuration: widget.animationDuration ?? 1000,
                maximum: widget.maxValue,
                //Style bar
                showTicks: false,
                showLabels: false,
                axisTrackStyle: LinearAxisTrackStyle(
                  thickness: widget.thickness ?? 10,
                  edgeStyle: LinearEdgeStyle.bothCurve,
                  color: BaseColorsLN.neutralsLightestGrey,
                ),
                //Value
                barPointers: [
                  LinearBarPointer(
                    enableAnimation: widget.animateRange ?? true,
                    value: widget.markerValue,
                    thickness: widget.thickness ?? 10,
                    edgeStyle: widget.barPointerEdgeStyle ?? LinearEdgeStyle.bothCurve,
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
              BaseColorsLN.speedCompare1,
              BaseColorsLN.speedCompare2,
            ],
        stops: const [0, 0.3]).createShader(bounds);
  }
}
