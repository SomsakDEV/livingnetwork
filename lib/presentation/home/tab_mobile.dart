// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:living_network/component/cell_tower/cell_tower_widget.dart';
import 'package:living_network/component/internet/usage.dart';
import 'package:living_network/component/map/map_widget.dart';
import 'package:living_network/component/mode/mode_widget.dart';
import 'package:living_network/component/performance_widget/p_main.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network/utility/clearData.dart';
import 'package:provider/provider.dart';

class TabMobile extends StatefulWidget {
  TabMobile({
    super.key,
  });

  @override
  State<TabMobile> createState() => _TabMobileState();
}

class _TabMobileState extends State<TabMobile> {
  final SizedBox _sizedBox = SizedBox(
    height: 8,
  );

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<LnProvider>(
      builder: (context, data, _) => RefreshIndicator(
        color: LNColor.primaryColor,
        onRefresh: () => data.loadData(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    height: h * 0.35,
                    width: w,
                    child: MapWidget(),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/map');
                    },
                    child: SizedBox(
                      height: h * 0.35,
                      width: w,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8), border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                    width: w * 0.93,
                    child: CellTowerWidget(),
                  ),
                ],
              ),
              _sizedBox,
              Container(
                decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8), border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                width: w * 0.93,
                child: PerformanceMain(),
              ),
              _sizedBox,
              // Container(
              //   decoration: BoxDecoration(
              //       color: Color(0xFFFFFFFF),
              //       borderRadius: BorderRadius.circular(8),
              //       border:
              //           Border.all(width: 3, color: Color(0xFFF0F0F0))),
              //   width: w * 0.93,
              //   child: SpeedComparingMain(),
              // ),
              _sizedBox,
              Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8), border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                      width: w * 0.93,
                      child: ModeWidget(),
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
                decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8), border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                width: w * 0.93,
                child: InternetUsage(),
              ),
              _sizedBox,
              ClearData(),
            ],
          ),
        ),
      ),
    );
  }
}
