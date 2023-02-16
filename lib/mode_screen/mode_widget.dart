// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers, prefer_const_constructors, dead_code, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_decision.dart';
import 'package:living_network/mode_screen/button/ui_bottomsheet_text.dart';
import 'package:living_network/themes/styles.dart';
import 'package:ui_style/ui_style.dart' as ui;
import 'package:living_network/mode_screen/button/ui_button.dart' as button;

class ModeWidget extends StatelessWidget {
  const ModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Card(
        color: Colors.blueGrey,
        child: Container(
          height: 232,
          width: 327,
          decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'packages/living_network/assets/images/5G_icon.png',
                      height: 44,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        'Mode',
                        style: BaseTextStyle.headerTextMode,
                        //textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (BuildContext context) {
                              return UiBottomSheetCardDialogTextMode();
                            },
                          );
                        },
                        icon: Icon(Icons.new_releases_rounded))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button.UiButtonMode(
                    icon: Image.asset(
                      'packages/living_network/assets/images/maxmode.jpg',
                      height: 15,
                      width: 15,
                    ),
                    title: 'Max Mode',
                    detail: 'default',
                    buttonType: button.ButtonType.primaryBtn,
                    height: 70,
                    width: 143,
                    borderRadius: 10,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return UiBottomSheetCardDialogMode(
                            title: 'Switch to Eco mode?',
                            desc: 'Detail: save battery',
                            textSubmitBtn: 'Switch to Eco mode',
                            onPressedSubmit: (isClicked) => print("active"),
                            onPressedCancel: (isClicked) =>
                                Navigator.pop(context),
                          );
                        },
                      );
                    },
                  ),
                  button.UiButtonMode(
                    icon: Image.asset(
                      'packages/living_network/assets/images/ecomode.jpg',
                      height: 15,
                      width: 15,
                    ),
                    title: 'Eco Mode',
                    detail: 'Save Battery',
                    buttonType: button.ButtonType.primaryBtn,
                    height: 70,
                    width: 143,
                    borderRadius: 10,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return UiBottomSheetCardDialogMode(
                            title: 'Switch to Eco mode?',
                            desc: 'Detail: save battery',
                            textSubmitBtn: 'Switch to Eco mode',
                            onPressedSubmit: (isClicked) => print("active"),
                            onPressedCancel: (isClicked) =>
                                Navigator.pop(context),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  button.UiButtonMode(
                    icon: Image.asset(
                      'packages/living_network/assets/images/livemode.jpg',
                      height: 15,
                      width: 15,
                    ),
                    title: 'Live Mode',
                    detail: 'Stream Smoothly',
                    buttonType: button.ButtonType.primaryBtn,
                    height: 70,
                    width: 143,
                    borderRadius: 10,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return UiBottomSheetCardDialogMode(
                            title: 'Switch to Eco mode?',
                            desc: 'Detail: save battery',
                            textSubmitBtn: 'Switch to Eco mode',
                            onPressedSubmit: (isClicked) => print("active"),
                            onPressedCancel: (isClicked) =>
                                Navigator.pop(context),
                          );
                        },
                      );
                    },
                  ),
                  button.UiButtonMode(
                    icon: Image.asset(
                      'packages/living_network/assets/images/gamemode.jpg',
                      height: 15,
                      width: 15,
                    ),
                    title: 'Game Mode',
                    detail: 'Lower Latency',
                    buttonType: button.ButtonType.primaryBtn,
                    height: 70,
                    width: 143,
                    borderRadius: 10,
                    onPress: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return UiBottomSheetCardDialogMode(
                            title: 'Switch to Eco mode?',
                            desc: 'Detail: save battery',
                            textSubmitBtn: 'Switch to Eco mode',
                            onPressedSubmit: (isClicked) => print("active"),
                            onPressedCancel: (isClicked) =>
                                Navigator.pop(context),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
