import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/internet_usage/iu_widget.dart';
import 'package:living_network/map_direction/m_card_detail.dart';
import 'package:solid_bottom_sheet/solid_bottom_sheet.dart';

class MapBottomSheet extends StatefulWidget {
  const MapBottomSheet({super.key});

  @override
  State<MapBottomSheet> createState() => _MapBottomSheetState();
}

class _MapBottomSheetState extends State<MapBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return SolidBottomSheet(
      
      maxHeight: 255.0,
      showOnAppear: true,
      headerBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Colors.white,
        ),
        height: 50,
        alignment: Alignment.topCenter,
        child: const SizedBox(
          width: 58,
          child: IUWidget(
            padding: EdgeInsets.only(bottom: 22),
            markerValue: 1,
            maxValue: 1,
            animateRange: false,
            thickness: 6,
            barColorGradient: [
              BaseColorsLN.verticalDivider,
              BaseColorsLN.verticalDivider,
            ],
          ),
        ),
      ),
      body: MapCardDetail(),
    );
  }
}
