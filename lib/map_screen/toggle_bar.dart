import 'package:flutter/material.dart';
import 'package:ui_style/base_color.dart';

class ToggleTab extends StatefulWidget {
  const ToggleTab({super.key});

  @override
  State<ToggleTab> createState() => _ToggleTabState();
}

class _ToggleTabState extends State<ToggleTab> {
  //  List<Widget> signal = <Widget>[
  //   const Text('4G', style: TextStyle(color: Colors.white)),
  //   const Text('5G', style: TextStyle(color: Colors.white))
  // ];
  List<Widget> signal = <Widget>[const Text('4G'), const Text('5G')];
  List<bool> selected = <bool>[true, false];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        color: Color(0xFFDAE1E6),
        border: Border.all(color: Color(0xFFDAE1E6), width: 0.5),
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
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        selectedBorderColor: Color(0xFF657884),
        selectedColor: Colors.green[200],
        fillColor: Colors.green[600],
        color: Color(0xFF657884),
        borderWidth: 1.0,
        borderColor: Color(0xFF4CA00),
        // selectedColor: Color(0x3364CA00),
        // fillColor: Color(0x9964CA00),
        constraints: const BoxConstraints(
          minHeight: 50.0,
          minWidth: 150.0,
        ),
        isSelected: selected,
        children: signal,
      ),
    );
  }
}
