import 'package:flutter/material.dart';
import 'package:living_network/mode_screen/button/ui_button.dart';

class LivingNetworkFiveGMode extends StatefulWidget {
  static const ROUTE_NAME = '/livingnetwork/5GMode';
  const LivingNetworkFiveGMode({super.key});

  @override
  State<LivingNetworkFiveGMode> createState() => _LivingNetworkFiveGModeState();
}

class _LivingNetworkFiveGModeState extends State<LivingNetworkFiveGMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Living Network'),
        ),
        body: Column(
          children: [
            UiButton(
              title: "4G - 4G",
              buttonType: ButtonType.secondaryBtn,
              onPress: () {
                Navigator.pushNamed(context, "/4G4G",
                    arguments: {'network': '4G', 'phone': '4G'});
              },
            ),
            UiButton(
              title: "4G - 5G",
              buttonType: ButtonType.secondaryBtn,
              onPress: () {
                Navigator.pushNamed(context, "/4G5G",
                    arguments: {'network': '4G', 'phone': '5G'});
              },
            ),
            UiButton(
              title: "5G - 4G",
              buttonType: ButtonType.secondaryBtn,
              onPress: () {
                Navigator.pushNamed(context, "/5G4G",
                    arguments: {'network': '5G', 'phone': '4G'});
              },
            ),
            UiButton(
              title: "5G - 5G",
              buttonType: ButtonType.secondaryBtn,
              onPress: () {
                Navigator.pushNamed(context, "/5G5G",
                    arguments: {'network': '5G', 'phone': '5G'});
              },
            ),
          ],
        ));
  }
}
