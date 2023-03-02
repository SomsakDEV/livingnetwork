// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/base_color_text/base_text_style.dart';
import 'package:living_network/living_network/presentation/pages/lvnw_main_home.dart';
import 'package:living_network/living_network/presentation/pages/lvnw_main_mobile.dart';

class LivingNetwork extends StatefulWidget {
  const LivingNetwork({
    Key? key,
  }) : super(key: key);

  @override
  State<LivingNetwork> createState() => _LivingNetworkState();
}

class _LivingNetworkState extends State<LivingNetwork> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: const Text('Living Network', style: LNBaseTextStyle.app_bar_style),
          backgroundColor: BaseColorsLN.whiteColor,
          leading: BackButton(
            color: BaseColorsLN.blackColor,
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(50),
                child: AppBar(
                  backgroundColor: Colors.white,
                  bottom: TabBar(
                    indicatorWeight: 4,
                    indicatorColor: Color(0xFF64CA00),
                    labelStyle: TextStyle(fontSize: 22),
                    labelColor: Color(0xFF64CA00),
                    unselectedLabelColor: Color(0xFF657884),
                    tabs: [
                      Tab(text: 'MOBILE'),
                      Tab(text: 'HOME'),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: [
                  LivingNetworkMobile(),
                  LivingNetworkHome(),
                ],
              ),
            )));
  }
}
