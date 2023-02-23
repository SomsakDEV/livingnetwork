// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_main_home.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_main_mobile.dart';

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
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Living Network',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
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
