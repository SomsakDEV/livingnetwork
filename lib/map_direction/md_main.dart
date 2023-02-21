import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:living_network/map_screen/map_widget.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MapDirection extends StatefulWidget {
  const MapDirection({super.key});

  @override
  State<MapDirection> createState() => _MapDirectionState();
}

class _MapDirectionState extends State<MapDirection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signal map', style: LNBaseTextStyle.head4Text),
        backgroundColor: Colors.white,
        leading: BackButton(color: Colors.black),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Expanded(
            child: SizedBox(
              child: MapWidget(),
            ),
          ),
        ],
      ),
      bottomSheet: SolidBottomSheet(
          headerBar: Container(
            color: Colors.amber,
            height: 50,
            child: Center(
              child: Text('Swipe'),
            ),
          ),
          body: Container(
            color: Colors.white,
            height: 30,
            child: Center(
              child: Text('Hello'),
            ),
          )),
    );
  }
}
