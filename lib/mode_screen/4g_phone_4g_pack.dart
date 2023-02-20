// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:living_network/base_color_text/base_color_ln.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_decision.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_text.dart';
import 'package:ui_style/ui_style.dart' as ui;
import 'package:living_network/mode_screen/button/ui_button.dart' as button;

import 'tab_bar/mode_tab_bar.dart';

class FourGPhoneFourGPackage extends StatefulWidget {
  const FourGPhoneFourGPackage({super.key});

  @override
  State<FourGPhoneFourGPackage> createState() => _FourGPhoneFourGPackageState();
}

class _FourGPhoneFourGPackageState extends State<FourGPhoneFourGPackage> {
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
