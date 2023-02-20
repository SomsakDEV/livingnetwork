import 'package:flutter/material.dart';
import 'package:ui_style/base_color.dart';

class ToggleSignal extends StatefulWidget {
  const ToggleSignal({super.key});
  @override
  State<ToggleSignal> createState() => _ToggleSignalState();
}

class _ToggleSignalState extends State<ToggleSignal> {
  List<Widget> signal = <Widget>[const Text('4G'), const Text('5G')];
  List<bool> selected = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: BaseColors.whiteColor,
        border: Border.all(color: BaseColors.greyColor, width: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: ToggleButtons(
        onPressed: (int index) {
          setState(() {
            // The button that is tapped is set to true, and the others to false.
            for (int i = 0; i < selected.length; i++) {
              selected[i] = i == index;
            }
          });
        },
        textStyle: const TextStyle(
            fontSize: 22, color: BaseColors.textColorTabbar, fontWeight: FontWeight.w500, fontFamily: 'DB Heaven'),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: BaseColors.kellyGreen100,
        selectedColor: BaseColors.whiteColor,
        fillColor: BaseColors.greenColor700,
        color: BaseColors.bgToastColor,
        borderWidth: 1.0,
        borderColor: BaseColors.greyColor,
        constraints: const BoxConstraints(
          minHeight: 38.0,
          minWidth: 160.25,
        ),
        isSelected: selected,
        children: signal,
      ),
    );
  }
}
