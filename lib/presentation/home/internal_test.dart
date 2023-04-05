// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/component/map/map_location_widget.dart';
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

  @override
  void initState() {
    _initialState();
    super.initState();
  }

  void _initialState() {
    bool status = false;
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return FutureBuilder(
            future: Provider.of<InternalProvider>(context, listen: false).initialCore(widget.token),
            builder: (context, snap) {
              if (snap.hasData) {
                if (status = (snap.data == 'Passed')) {
                  DateTime? sExpire = Provider.of<InternalProvider>(context, listen: false).sExpire;
                  if (sExpire != null) {
                    print('[LIVING_NETWORK] Session expire : $sExpire');
                    int sec = sExpire.difference(DateTime.now()).inSeconds;
                    if (sec > 0) {
                      status = true;
                      duration = Duration(seconds: sec);
                      timer = Timer.periodic(const Duration(seconds: 1), (_) => _counting());
                    }
                  }
                }
                if (status) {
                  return _popup5G();
                } else {
                  Navigator.pop(context);
                  return SizedBox();
                }
              } else {
                return SizedBox();
              }
            },
          );
        },
      ),
    );
  }

  Widget _popup5G() {
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
                  onPress: () => Navigator.pop(context),
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
  }

  void _counting() {
    final seconds = duration.inSeconds - 1;
    if (seconds < 1) {
      timer.cancel();
      Provider.of<InternalProvider>(context).setStatus('Expire');
    } else {
      duration = Duration(seconds: seconds);
    }
  }

  Widget errorDialog(String content, String subContent, String onSubmit) {
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
                Text(content, style: LNStyle.dialogHeader),
                SizedBox(
                  height: 8,
                ),
                Text(subContent, textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
                SizedBox(
                  height: 16,
                ),
                Button(
                  textStyle: LNStyle.dialogButtonText,
                  title: onSubmit,
                  buttonType: ButtonType.primaryBtn,
                  onPress: _onExit,
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
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Consumer<InternalProvider>(
      builder: (context, data, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Living Network', style: LNStyle.modeWidgetTitle),
            backgroundColor: Colors.white,
            centerTitle: false,
            leading: BackButton(
              color: LNColor.blackColor,
              // onPressed: _onExit,
              onPressed: _onExit,
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
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: <Widget>[
                          SizedBox(
                            height: h * 0.35,
                            width: w,
                            child: MapNearByWidget(select1: true, select2: true),
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.pushNamed(context, 'map');
                          //   },
                          //   child: SizedBox(
                          //     height: h * 0.35,
                          //     width: w,
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(height: 8),
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
                        'Detected Network Type : ${data.detect}',
                        style: TextStyle(color: LNColor.failColor, fontSize: 20),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Data : ${data.mode5G == null ? "Loading . . ." : data.mode5G!.toJson()}',
                          style: TextStyle(color: LNColor.failColor, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.4,
                      ),
                      _alertDialog(data.status),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _alertDialog(String value) {
    String content = "Something wrong !!!";
    String subContent = "Service is not ready. Please try again later";
    String onSubmit = "Exit";
    switch (value) {
      case 'Expire':
        {
          content = "Session timeout";
          subContent = "Please Login again!!!!!";
          onSubmit = "OK";
          break;
        }
      default:
        return;
    }
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(content),
          content: Text(subContent),
          actions: [
            TextButton(
              onPressed: _onExit(true),
              child: Text(onSubmit),
            ),
          ],
        );
      },
    );
  }

  _onExit([bool boo = false]) {
    print('[LIVING_NETWORK] : Clear on exit');
    if (Platform.isIOS) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    } else {
      SystemNavigator.pop();
      if (boo) {
        dispose();
      }
    }
  }

  @override
  void dispose() {
    print('[LIVING_NETWORK] : dispose');
    Provider.of<InternalProvider>(context).dispose();
    super.dispose();
  }
}
