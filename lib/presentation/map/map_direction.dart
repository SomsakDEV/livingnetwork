import 'package:flutter/material.dart';
import 'package:living_network/component/map_direction/m_bottom_sheet.dart';
import 'package:living_network/constance/LNStyle.dart';

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
        title: const Text('Signal map', style: LNStyle.head4Text),
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: const [
          Expanded(
            child: SizedBox(
              // child: MapWidget(),
            ),
          ),
        ],
      ),
      bottomSheet: MapBottomSheet(),
    );
  }
}
