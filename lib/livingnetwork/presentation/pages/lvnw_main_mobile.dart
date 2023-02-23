// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:living_network/cell_tower_info/ct_main.dart';
import 'package:living_network/internet_usage/iu_main.dart';
import 'package:living_network/map_screen/map_widget.dart';
import 'package:living_network/performance_widget/p_main.dart';
import 'package:living_network/speed_comparing/sc_main.dart';
import 'package:ui_style/ui_style.dart';

class LivingNetworkMobile extends StatefulWidget {
  static const ROUTE_NAME = '/livingnetwork';
  final String network;
  final String phone;

  const LivingNetworkMobile({
    super.key,
    required this.network,
    required this.phone,
  });

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
        barrierDismissible: false,
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
                          'packages/living_network/assets/images/Image.png',
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
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                color: Colors.amber,
                child: MapWidget(),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.85,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFFF0F0F0),
              )
            ],
          ),
          Positioned(
              top: MediaQuery.of(context).size.height * 0.30,
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
                    child: CellTowerInfoMain(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                    width: MediaQuery.of(context).size.width * 0.93,
                    child: PerformanceMain(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                    width: MediaQuery.of(context).size.width * 0.93,
                    child: SpeedComparingMain(),
                  ),
                  _sizedBox,
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                    width: MediaQuery.of(context).size.width * 0.93,
                    child: InternetUsage(),
                  ),
                  _sizedBox,
                  Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(width: 3, color: Color(0xFFF0F0F0))),
                      width: MediaQuery.of(context).size.width * 0.93,
                      child: 
                      Container(
                        // decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.all(Radius.circular(8)),
                        //     gradient: LinearGradient(
                        //         begin: FractionalOffset.centerLeft,
                        //         end: FractionalOffset.centerRight,
                        //         colors: const [
                        //           Color(0xFF9EDE3E),
                        //           Color(0xFF64CA00)
                        //         ])),
                        // width: 90,
                        // height: 24,
                        // child: Row(children: [
                        //   Image.asset(
                        //     'packages/livingnetwork/assets/images/Vector.png',
                        //     width: 11.44,
                        //     height: 13,),
                        //   TimeWidget(
                        //     expire: DateTime(2023, 2, 21),
                        //   )
                        // ]),
                      )
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
