// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/component/mode/button.dart';
import 'package:living_network/component/mode/mode_widget.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';

class Mode5GInternal extends StatefulWidget {
  String token;

  Mode5GInternal({Key? key, required this.token}) : super(key: key);

  @override
  State<Mode5GInternal> createState() => _Mode5GInternalState();
}

class _Mode5GInternalState extends State<Mode5GInternal> {
  late Duration duration;
  late Timer timer;

  _counting() {
    final seconds = duration.inSeconds - 1;
    if (seconds < 0) {
      _sessionExpire();
      timer.cancel();
    } else {
      duration = Duration(seconds: seconds);
    }
  }

  _sessionExpire() {
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Dialog(
            backgroundColor: LNColor.transparent,
            child: Wrap(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: LNColor.neutralsWhite,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        child: Image.asset(ImageUtils.getImagePath('assets/piggy.gif')),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Text('Please Login again!!!!!', textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
                      SizedBox(
                        height: 16,
                      ),
                      Button(
                        textStyle: LNStyle.dialogButtonText,
                        title: "OK",
                        buttonType: ButtonType.primaryBtn,
                        onPress: () {
                          SystemNavigator.pop();
                        },
                        borderRadius: 6,
                        width: 236,
                        height: 36,
                      ),
                      SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
          (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return FutureBuilder(
            future: Provider.of<InternalProvider>(context, listen: false).initialCore(widget.token),
            builder: (context, snap) {
              if (snap.hasData && 'true' == snap.data.toString()) {
                DateTime sExpire = Provider.of<InternalProvider>(context).sExpire ?? DateTime.now().add(Duration(hours: 1));
                print('[LIVING_NETWORK] Session expire : $sExpire');
                int sec = sExpire.difference(DateTime.now()).inSeconds;
                duration = Duration(seconds: sec <= 0 ? 0 : sec);
                timer = Timer.periodic(
                    const Duration(seconds: 1),
                        (_) => setState(() {
                      _counting();
                    }));
                return Dialog(
                  backgroundColor: LNColor.transparent,
                  child: Wrap(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: LNColor.neutralsWhite,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
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
                            Text('Switch your connection mode to suite\nyour demand the most.', textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
                            SizedBox(
                              height: 16,
                            ),
                            Button(
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
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else if (snap.hasError || 'false' == snap.data.toString()) {
                return Dialog(
                  backgroundColor: LNColor.transparent,
                  child: Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: LNColor.neutralsWhite,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text('Something wrong !!!', style: LNStyle.dialogHeader),
                            SizedBox(
                              height: 8,
                            ),
                            Text('Service is not ready. Please try again later', textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
                            SizedBox(
                              height: 16,
                            ),
                            Button(
                              textStyle: LNStyle.dialogButtonText,
                              title: "Exit",
                              buttonType: ButtonType.primaryBtn,
                              onPress: () {
                                SystemNavigator.pop();
                              },
                              borderRadius: 6,
                              width: 236,
                              height: 36,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Dialog(
                  backgroundColor: LNColor.transparent,
                  child: SizedBox(),
                );
              }
            },
          );
        },
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('5G Mode', style: LNStyle.modeWidgetTitle),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: BackButton(
          color: LNColor.blackColor,
          onPressed: () => SystemNavigator.pop(),
        ),
      ),
      body: RefreshIndicator(
        color: LNColor.primaryColor,
        onRefresh: () => Provider.of<InternalProvider>(context, listen: false).internalPrepare(widget.token),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: h * 0.13,
                  ),
                  Container(
                    alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 3,
                        color: Color(0xFFF0F0F0),
                      ),
                    ),
                    width: w * 0.93,
                    child: ModeWidget(),
                  ),
                  Text(
                    'Detected Network Type : ${Provider.of<InternalProvider>(context, listen: true).status}',
                    style: TextStyle(color: LNColor.failColor, fontSize: 20),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Data : ${Provider.of<InternalProvider>(context, listen: true).mode5G == null ? "Loading . . ." : Provider.of<InternalProvider>(context, listen: true).mode5G!.toJson()}',
                      style: TextStyle(color: LNColor.failColor, fontSize: 17),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
