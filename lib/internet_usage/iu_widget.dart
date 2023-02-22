import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class IUWidget extends StatefulWidget {
  final List<LinearMarkerPointer>? markerPointers;
  final double maxValue;
  final double markerValue;
  final List<Color>? barColorGradient;
  final LinearEdgeStyle? barPointerEdgeStyle;

  const IUWidget({
    required this.maxValue,
    required this.markerValue,
    this.markerPointers,
    this.barColorGradient,
    this.barPointerEdgeStyle,
    super.key,
  });

  @override
  State<IUWidget> createState() => _IUWidgetState();
}

class _IUWidgetState extends State<IUWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, right: 10, bottom: 10),
      child: Row(
        // mainAxisSize: MainAxisSize.max,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
                  color: BaseColorsLN.neutralsLightestGrey,
                ),
                //Value
                barPointers: [
                  LinearBarPointer(
                    value: widget.markerValue,
                    thickness: 10,
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
