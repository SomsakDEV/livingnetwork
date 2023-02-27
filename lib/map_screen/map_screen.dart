import 'package:flutter/material.dart';
import 'package:living_network/map_screen/button_selection.dart';
import 'package:living_network/map_screen/places_widget.dart';
import 'package:living_network/map_screen/map_widget.dart';
import 'package:living_network/map_screen/toggle_signal_widget.dart';
import 'package:ui_style/base_color.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _select1 = true;
  bool _select2 = true;
  SizedBox getHBox([double a = 15.0]) => SizedBox(height: a);
  SizedBox getWBox([double a = 15.0]) => SizedBox(width: a);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Signal map',
                style: TextStyle(
                  color: BaseColors.blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
        backgroundColor: BaseColors.whiteColor,
        leading: const BackButton(color: BaseColors.blackColor),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 395,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                MapWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: ToggleSignal(),
                ),
              ],
            ),
          ),
          getHBox(),
          const Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Signal Nearby',
                    style: TextStyle(
                      color: Color(0xFF38454C),
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                    )),
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
                  child: ButtonSelection(
                    marginColor: BaseColors.greenDark1A,
                    selectedBackgroundColor: BaseColors.greenColor100,
                    selectedBorderColor: BaseColors.primaryColor,
                    unselectedBackgroundColor: BaseColors.neutralsWhite,
                    unselectedBorderColor: BaseColors.greyBtnColor,
                    unselectedOpacity: 0.5,
                    opacityAnimationDuration: 300,
                    selected: _select1,
                    onValueChanged: (newValue) {
                      setState(() {
                        _select1 = newValue;
                      });
                    },
                    child: buildButton('AIS Shop', 'packages/living_network/assets/images/ais_shop.png'),
                  ),
                ),
                getWBox(),
                Expanded(
                  child: ButtonSelection(
                    marginColor: BaseColors.greenDark1A,
                    selectedBackgroundColor: BaseColors.greenColor100,
                    selectedBorderColor: BaseColors.primaryColor,
                    unselectedBackgroundColor: BaseColors.neutralsWhite,
                    unselectedBorderColor: BaseColors.greyBtnColor,
                    unselectedOpacity: 0.5,
                    opacityAnimationDuration: 300,
                    selected: _select2,
                    onValueChanged: (newValue) {
                      setState(() {
                        _select2 = newValue;
                      });
                    },
                    child: buildButton('AIS Wifi', 'packages/living_network/assets/images/ais_wifi.png'),
                  ),
                ),
              ],
            ),
          ),
          getWBox(),
          // FutureBuilder(builder: builder)
          ListPlaceDetail(
            select1: _select1,
            select2: _select2,
          ),
        ],
      ),
    );
  }

  Widget buildButton(String title, String image) {
    return Column(children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain, alignment: Alignment.center),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(title,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 18,
                fontWeight: FontWeight.w700,
              )),
        ],
      )
    ]);
  }
}
