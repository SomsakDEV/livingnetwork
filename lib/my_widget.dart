import 'package:flutter/material.dart';
import 'package:living_network/internet_usage/iu_main.dart';
import 'package:living_network/map_direction/md_main.dart';
import 'package:living_network/sale_badge_widget/sb_main.dart';
import 'package:living_network/speed_comparing/sc_main.dart';

import 'package:living_network_repository/function_a.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/map_direction');
                },
                child: Text('Direction'))
          ],
        ),
      ),
    );
  }
}
