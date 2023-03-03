// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/presentation/home/tab_home.dart';
import 'package:living_network/presentation/home/tab_mobile.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          title: const Text('Living Network', style: LNStyle.app_bar_style),
          backgroundColor: BaseColorsLN.whiteColor,
          leading: BackButton(
            color: BaseColorsLN.blackColor,
            onPressed: () => SystemNavigator.pop(),
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
                  TabMobile(),
                  TabHome(),
                ],
              ),
            )));
  }
}
