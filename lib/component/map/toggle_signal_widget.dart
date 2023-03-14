import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';

class ToggleSignal extends StatefulWidget {
  const ToggleSignal({super.key});
  @override
  State<ToggleSignal> createState() => _ToggleSignalState();
}

class _ToggleSignalState extends State<ToggleSignal> {
  List<bool> selected = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    var conH = MediaQuery.of(context).size.height;
    var conW = MediaQuery.of(context).size.width;
    return Container(
      height: conH * 0.0350,
      decoration: BoxDecoration(
        color: LNColor.whiteColor,
        border: Border.all(color: LNColor.greyColor, width: 1),
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: ToggleButtons(
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < selected.length; i++) {
              selected[i] = i == index;
            }
          });
        },
        textStyle: const TextStyle(
            fontSize: 22, color: LNColor.textColorTabbar, fontWeight: FontWeight.w500, fontFamily: 'DB Heaven'),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: LNColor.kellyGreen100,
        selectedColor: LNColor.whiteColor,
        fillColor: LNColor.greenColor700,
        color: LNColor.bgToastColor,
        borderWidth: 0.5,
        borderColor: LNColor.greyColor,
        isSelected: selected,
        children: <Widget>[
          SizedBox(
            width: conW * 0.365,
            child: const Center(child: Text('4G')),
          ),
          SizedBox(
            width: conW * 0.365,
            child: const Center(child: Text('5G')),
          ),
        ],
      ),
    );
  }
}
