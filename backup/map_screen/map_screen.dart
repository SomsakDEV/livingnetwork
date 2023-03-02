// import 'package:flutter/material.dart';
// import 'package:living_network/base_color_text/base_color_ln.dart';
// import 'package:living_network/base_color_text/base_text_style.dart';
// import 'package:living_network/map_screen/button_selection.dart';
// import 'package:living_network/map_screen/places_widget.dart';
// import 'package:living_network/map_screen/map_widget.dart';
// import 'package:living_network/map_screen/toggle_signal_widget.dart';
// import 'package:living_network/utility/image_utils.dart';

// class MapScreen extends StatefulWidget {
//   const MapScreen({super.key});

//   @override
//   State<MapScreen> createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   bool _select1 = true;
//   bool _select2 = true;

//   SizedBox getHBox(double a) => SizedBox(height: a);

//   SizedBox getWBox(double a) => SizedBox(width: a);

//   @override
//   Widget build(BuildContext context) {
//     var conH = MediaQuery.of(context).size.height;
//     var conW = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         title: const Text('Signal map', style: LNBaseTextStyle.app_bar_style),
//         backgroundColor: BaseColorsLN.whiteColor,
//         leading: const BackButton(color: BaseColorsLN.blackColor),
//       ),
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           SizedBox(
//             height: conH * 0.4,
//             child: Stack(
//               alignment: Alignment.topCenter,
//               children: [
//                 MapWidget(),
//                 Padding(
//                   padding: EdgeInsets.only(top: 15.0),
//                   child: ToggleSignal(),
//                 ),
//               ],
//             ),
//           ),
//           getHBox(conH * 0.02),
//           Padding(
//             padding: EdgeInsets.only(left: 20.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [Text('Signal Nearby', style: LNBaseTextStyle.header_map_1)],
//             ),
//           ),
//           getHBox(conH * 0.01),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: Row(
//               mainAxisSize: MainAxisSize.max,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Expanded(
//                   child: ButtonSelection(
//                     marginColor: BaseColorsLN.greenDark1A,
//                     selectedBackgroundColor: BaseColorsLN.greenColor100,
//                     selectedBorderColor: BaseColorsLN.primaryColor,
//                     unselectedBackgroundColor: BaseColorsLN.neutralsWhite,
//                     unselectedBorderColor: BaseColorsLN.greyBtnColor,
//                     unselectedOpacity: 0.5,
//                     opacityAnimationDuration: 300,
//                     selected: _select1,
//                     onValueChanged: (newValue) {
//                       setState(() {
//                         _select1 = newValue;
//                       });
//                     },
//                     child: buildButton('AIS Shop', ImageUtils.getImagePath('assets/images/ais_shop.png')),
//                   ),
//                 ),
//                 getWBox(conW * 0.05),
//                 Expanded(
//                   child: ButtonSelection(
//                     marginColor: BaseColorsLN.greenDark1A,
//                     selectedBackgroundColor: BaseColorsLN.greenColor100,
//                     selectedBorderColor: BaseColorsLN.primaryColor,
//                     unselectedBackgroundColor: BaseColorsLN.neutralsWhite,
//                     unselectedBorderColor: BaseColorsLN.greyBtnColor,
//                     unselectedOpacity: 0.5,
//                     opacityAnimationDuration: 300,
//                     selected: _select2,
//                     onValueChanged: (newValue) {
//                       setState(() {
//                         _select2 = newValue;
//                       });
//                     },
//                     child: buildButton('AIS Wifi', ImageUtils.getImagePath('assets/images/ais_wifi.png')),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           getHBox(conH * 0.02),
//           // FutureBuilder(builder: builder)
//           ListPlaceDetail(
//             select1: _select1,
//             select2: _select2,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildButton(String title, String image) {
//     return Column(children: <Widget>[
//       Row(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           Container(
//             height: 45,
//             width: 45,
//             decoration: BoxDecoration(
//               image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain, alignment: Alignment.center),
//             ),
//           ),
//           const SizedBox(
//             width: 8.0,
//           ),
//           Text(title, style: LNBaseTextStyle.map_button_selection)
//         ],
//       )
//     ]);
//   }
// }
