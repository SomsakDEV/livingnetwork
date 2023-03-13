// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:living_network/component/map/map_widget.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';

// import 'package:living_network/cell_tower_info/ct_main.dart';
import 'package:living_network/component/internet/usage.dart';

// import 'package:living_network/map_screen/map_widget.dart';
import 'package:living_network/component/mode/button.dart';
import 'package:living_network/component/mode/mode_widget.dart';
import 'package:living_network/utility/clearData.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:living_network_repository/domain/entities/display_mode_widget.dart';

// import 'package:living_network/performance_widget/p_main.dart';
// import 'package:living_network/speed_comparing/sc_main.dart';

class TabMobile extends StatefulWidget {
  static const ROUTE_NAME = '/livingnetwork';
  late DisplayModeWidget display;

  TabMobile({
    required this.display,
    super.key,
  });

  @override
  State<TabMobile> createState() => _TabMobileState();
}

class _TabMobileState extends State<TabMobile> {
  final SizedBox _sizedBox = SizedBox(
    height: 12,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.35,
          //   width: MediaQuery.of(context).size.width,
          //   color: Colors.amber,
          //   child: MapWidget(),
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.pushNamed(context, '/livingnetwork/map');
          //   },
          //   child: SizedBox(
          //     height: MediaQuery.of(context).size.height * 0.35,
          //     width: MediaQuery.of(context).size.width,
          //   ),
          // ),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.30,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Color(0xFFFFFFFF),
                      //       borderRadius: BorderRadius.circular(8),
                      //       border:
                      //           Border.all(width: 3, color: Color(0xFFF0F0F0))),
                      //   width: MediaQuery.of(context).size.width * 0.93,
                      //   child: CellTowerInfoMain(),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Color(0xFFFFFFFF),
                      //       borderRadius: BorderRadius.circular(8),
                      //       border:
                      //           Border.all(width: 3, color: Color(0xFFF0F0F0))),
                      //   width: MediaQuery.of(context).size.width * 0.93,
                      //   child: PerformanceMain(),
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Color(0xFFFFFFFF),
                      //       borderRadius: BorderRadius.circular(8),
                      //       border:
                      //           Border.all(width: 3, color: Color(0xFFF0F0F0))),
                      //   width: MediaQuery.of(context).size.width * 0.93,
                      //   child: SpeedComparingMain(),
                      // ),
                      _sizedBox,
                      Stack(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 5.0),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 3, color: Color(0xFFF0F0F0))),
                              width: MediaQuery.of(context).size.width * 0.93,
                              child: ModeWidget(
                               display: widget.display,
                              ),
                            ),
                          ),
                          // Positioned(
                          //   right: 20,
                          //   child: Image.asset(
                          //     ImageUtils.getImagePath('assets/images/mode_new_feature.png'),
                          //     height: 26,
                          //     width: 149,
                          //   ),
                          // ),
                        ],
                      ),
                      _sizedBox,
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFFFFFFF),
                            borderRadius: BorderRadius.circular(8),
                            border:
                                Border.all(width: 3, color: Color(0xFFF0F0F0))),
                        width: MediaQuery.of(context).size.width * 0.93,
                        child: InternetUsage(),
                      ),
                      _sizedBox,
                      ClearData(),
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
