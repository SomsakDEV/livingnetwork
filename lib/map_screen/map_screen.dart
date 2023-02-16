// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:living_network/map_screen/places_widget.dart';
import 'package:living_network/map_screen/map_widget.dart';
import 'package:living_network/map_screen/toggle_bar.dart';
import 'package:ui_style/ui_style.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  SizedBox getHBox([var a = 15]) => SizedBox(height: a);
  SizedBox getWBox([var a = 15]) => SizedBox(width: a);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signal map'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            height: 300,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const MapWidget(),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: ToggleTab(),
                ),
              ],
            ),
          ),
          getHBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Signal Nearby', style: BaseTextStyle.head1Text),
              ],
            ),
          ),
          getHBox(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: UiButton(title: 'AIS Shop', buttonType: ButtonType.primaryBtn, height: 50, borderRadius: 10),
                ),
                getWBox(),
                Expanded(
                  child: UiButton(title: 'AIS Wifi', buttonType: ButtonType.secondaryBtn, height: 50, borderRadius: 10),
                ),
              ],
            ),
          ),
          getWBox(),
          // FutureBuilder(builder: builder)
          ListPlaceDetail(),
          // Container(
          //   color: Colors.red,
          //   height: 20,
          // )
        ],
      ),
    );
  }
}
