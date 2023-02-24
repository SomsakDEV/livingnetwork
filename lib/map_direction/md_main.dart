import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:living_network/map_direction/m_bottom_sheet.dart';
import 'package:living_network/map_screen/map_widget.dart';

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
      bottomSheet: MapBottomSheet(),
    );
  }
}
