// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ui_style/base_color.dart';
import 'package:ui_style/ui_button.dart';
import 'package:ui_style/ui_popup_dialog.dart';

class LivingNetworkMobile extends StatefulWidget {
  static const ROUTE_NAME = '/livingnetwork';
  const LivingNetworkMobile({super.key});

  @override
  State<LivingNetworkMobile> createState() => _LivingNetworkMobileState();
}

class _LivingNetworkMobileState extends State<LivingNetworkMobile> {
  final SizedBox _sizedBox = SizedBox(
    height: 12,
  );

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              backgroundColor: BaseColors.transparent,
              child: Wrap(children: [
                Container(
                    decoration: const BoxDecoration(
                      color: BaseColors.neutralsWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: Image.asset(
                          'packages/living_network/assets/images/image.png',
                          width: 260,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        '5G Modes!',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'AIS 5G customer can now switch\nconnection mode to suite your\ndemand the most.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: BaseColors.secondaryColor,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      UiButton(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: BaseColors.whiteColor),
                        title: "Got it",
                        buttonType: ButtonType.primaryBtn,
                        onPress: () {
                          Navigator.pop(context);
                        },
                        borderRadius: 6,
                        width: 236,
                        height: 36,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ]))
              ]));
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.32,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFF0F0F0),
              )
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.23,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  _sizedBox,
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  _sizedBox,
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  _sizedBox,
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
