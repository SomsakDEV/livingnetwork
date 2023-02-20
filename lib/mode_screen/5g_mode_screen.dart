// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:living_network/mode_screen/4g_phone_4g_pack.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FiveGModeScreen extends StatefulWidget {
  const FiveGModeScreen({super.key});

  @override
  State<FiveGModeScreen> createState() => _FiveGModeScreenState();
}

class _FiveGModeScreenState extends State<FiveGModeScreen> {
  late SharedPreferences sharedPreferences;

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(),
    );
  }
}

Map<String, WidgetBuilder> routes = {
  '4GPhone4GPack ': (BuildContext context) => FourGPhoneFourGPackage(),
};
