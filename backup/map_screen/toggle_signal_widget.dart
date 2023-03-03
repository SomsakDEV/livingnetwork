// import 'package:flutter/material.dart';
// import 'package:living_network/base_color_text/LNColor.dart';

// class ToggleSignal extends StatefulWidget {
//   const ToggleSignal({super.key});
//   @override
//   State<ToggleSignal> createState() => _ToggleSignalState();
// }

// class _ToggleSignalState extends State<ToggleSignal> {
//   List<bool> selected = <bool>[true, false];
//   @override
//   Widget build(BuildContext context) {
//     var conH = MediaQuery.of(context).size.height;
//     var conW = MediaQuery.of(context).size.width;
//     return Container(
//       height: conH * 0.0350,
//       decoration: BoxDecoration(
//         color: BaseColorsLN.whiteColor,
//         border: Border.all(color: BaseColorsLN.greyColor, width: 1),
//         borderRadius: const BorderRadius.all(Radius.circular(8.0)),
//       ),
//       child: ToggleButtons(
//         onPressed: (int index) {
//           setState(() {
//             for (int i = 0; i < selected.length; i++) {
//               selected[i] = i == index;
//             }
//           });
//         },
//         textStyle: const TextStyle(
//             fontSize: 22, color: BaseColorsLN.textColorTabbar, fontWeight: FontWeight.w500, fontFamily: 'DB Heaven'),
//         borderRadius: const BorderRadius.all(Radius.circular(8)),
//         selectedBorderColor: BaseColorsLN.kellyGreen100,
//         selectedColor: BaseColorsLN.whiteColor,
//         fillColor: BaseColorsLN.greenColor700,
//         color: BaseColorsLN.bgToastColor,
//         borderWidth: 0.5,
//         borderColor: BaseColorsLN.greyColor,
//         isSelected: selected,
//         children: <Widget>[
//           SizedBox(
//             width: conW * 0.365,
//             child: const Center(child: Text('4G')),
//           ),
//           SizedBox(
//             width: conW * 0.365,
//             child: const Center(child: Text('5G')),
//           ),
//         ],
//       ),
//     );
//   }
// }
