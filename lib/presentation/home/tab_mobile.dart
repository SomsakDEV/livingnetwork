// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
// import 'package:living_network/cell_tower_info/ct_main.dart';
import 'package:living_network/component/internet/usage.dart';
// import 'package:living_network/map_screen/map_widget.dart';
import 'package:living_network/component/mode/ui_button.dart';
import 'package:living_network/model/mode/mode_widget.dart';
import 'package:living_network/utility/image_utils.dart';
// import 'package:living_network/performance_widget/p_main.dart';
// import 'package:living_network/speed_comparing/sc_main.dart';

class TabMobile extends StatefulWidget {
  static const ROUTE_NAME = '/livingnetwork';

  const TabMobile({
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
              backgroundColor: BaseColorsLN.transparent,
              child: Wrap(children: [
                Container(
                    decoration: const BoxDecoration(
                      color: BaseColorsLN.neutralsWhite,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Column(children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: Image.asset(
                          ImageUtils.getImagePath('assets/images/image.png'),
                          width: 260,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text('5G Modes!', style: LNStyle.dialogHeader),
                      SizedBox(
                        height: 8,
                      ),
                      Text('Switch your connection mode to suite\nyour demand the most.',
                          textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
                      SizedBox(
                        height: 16,
                      ),
                      UiButton(
                        textStyle: LNStyle.dialogButtonText,
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
    String network = '5G'; //wifi, 4G, 5G
    String package = 'Pack5G'; //Pack4G, Pack5G
    bool soc = true; //CallId ว่าง หรือ ไม่ว่าง
    bool faultManagement = true; // มี alarm ไม่มี alarm
    bool ds4 = true; // ECO ว่าง หรือ ไม่ว่าง

    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          // Container(
          //   height: MediaQuery.of(context).size.height * 0.35,
          //   width: MediaQuery.of(context).size.width,
          //   color: Colors.amber,
          //   child: MapWidget(),
          // ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/livingnetwork/map');
            },
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width,
            ),
          ),
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
                                    border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                                width: MediaQuery.of(context).size.width * 0.93,
                                child: ModeWidget(
                                  network: network,
                                  package: package,
                                  soc: soc,
                                  faultManagement: faultManagement,
                                  ds4: ds4,
                                )),
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
                            border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                        width: MediaQuery.of(context).size.width * 0.93,
                        child: InternetUsage(),
                      ),
                      _sizedBox
                    ],
                  )),
            ],
          )
        ],
      ),
    );
  }
}
