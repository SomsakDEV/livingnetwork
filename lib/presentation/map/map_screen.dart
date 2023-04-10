import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/component/map/button_selection.dart';
import 'package:living_network/component/map/map_location_widget.dart';
import 'package:living_network/component/map/places_widget.dart';
import 'package:living_network/component/map/toggle_signal_widget.dart';
import 'package:living_network/component/mode/button.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:living_network/utility/image_utils.dart';
import 'package:provider/provider.dart';


class MapScreen extends StatefulWidget {
  String token;
  MapScreen({super.key, required this.token});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _select1 = true;
  bool _select2 = true;

  late Duration duration;
  late Timer timer;

  SizedBox getHBox(double a) => SizedBox(height: a);

  SizedBox getWBox(double a) => SizedBox(width: a);

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

                }
                Navigator.pop(context);
                Provider.of<InternalProvider>(context).setStatus(snap.data as String);
                return SizedBox();
              } else {
                return SizedBox();
              }
            },
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var conH = MediaQuery.of(context).size.height;
    var conW = MediaQuery.of(context).size.width;

    return Consumer<InternalProvider>(
        builder: (context, data, _) {
          switch (data.status) {
            case 'Passed':
              return Scaffold(
                appBar: AppBar(
                  centerTitle: false,
                  title: const Text('Signal map', style: LNStyle.app_bar_style),
                  backgroundColor: LNColor.whiteColor,
                  leading: const BackButton(color: LNColor.blackColor),
                ),
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: conH * 0.4,
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          MapNearByWidget(select1: _select1, select2: _select2),
                          Padding(
                            padding: EdgeInsets.only(top: 15.0),
                            child: ToggleSignal(),
                          ),
                        ],
                      ),
                    ),
                    getHBox(conH * 0.02),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Location', style: LNStyle.header_map_1)
                        ],
                      ),
                    ),
                    getHBox(conH * 0.01),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ButtonSelection(
                              marginColor: LNColor.greenDark1A,
                              selectedBackgroundColor: LNColor.greenColor100,
                              selectedBorderColor: LNColor.primaryColor,
                              unselectedBackgroundColor: LNColor.neutralsWhite,
                              unselectedBorderColor: LNColor.greyBtnColor,
                              unselectedOpacity: 0.5,
                              opacityAnimationDuration: 300,
                              selected: _select1,
                              onValueChanged: (newValue) {
                                setState(() {
                                  _select1 = newValue;
                                });
                              },
                              child: buildButton('AIS Shop', ImageUtils
                                  .getImagePath('assets/images/ais_shop.png')),
                            ),
                          ),
                          getWBox(conW * 0.05),
                          Expanded(
                            child: ButtonSelection(
                              marginColor: LNColor.greenDark1A,
                              selectedBackgroundColor: LNColor.greenColor100,
                              selectedBorderColor: LNColor.primaryColor,
                              unselectedBackgroundColor: LNColor.neutralsWhite,
                              unselectedBorderColor: LNColor.greyBtnColor,
                              unselectedOpacity: 0.5,
                              opacityAnimationDuration: 300,
                              selected: _select2,
                              onValueChanged: (newValue) {
                                setState(() {
                                  _select2 = newValue;
                                });
                              },
                              child: buildButton('AIS Wifi', ImageUtils
                                  .getImagePath('assets/images/ais_wifi.png')),
                            ),
                          ),
                        ],
                      ),
                    ),
                    getHBox(conH * 0.02),
                    // FutureBuilder(builder: builder)
                    ListPlaceDetail(
                      select1: _select1,
                      select2: _select2,
                    ),
                  ],
                ),
              );
            case 'Failed':
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
                          Text('Something wrong !!!',
                              style: LNStyle.dialogHeader),
                          SizedBox(
                            height: 8,
                          ),
                          Text('Service is not ready. Please try again later',
                              textAlign: TextAlign.center,
                              style: LNStyle.dialogTitleText),
                          SizedBox(
                            height: 16,
                          ),
                          Button(
                            textStyle: LNStyle.dialogButtonText,
                            title: "Exit",
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
            case 'Expire':
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
                          ClipRRect(borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                              child: SizedBox(width: 260)),
                          SizedBox(
                            height: 16,
                          ),
                          Text('Please Login again!!!!!',
                              textAlign: TextAlign.center,
                              style: LNStyle.dialogTitleText),
                          SizedBox(
                            height: 16,
                          ),
                          Button(
                            textStyle: LNStyle.dialogButtonText,
                            title: "OK",
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
          // case 'CallBack':
          //   _initialState(false);
          //   return Dialog(
          //     backgroundColor: LNColor.transparent,
          //     child: SizedBox(),
          //   );
            default:
              return Dialog(
                backgroundColor: LNColor.transparent,
                child: SizedBox(),
              );
          }
        }
          );
        }

  _onExit() {
    SystemNavigator.pop();
    print('[LIVING_NETWORK] : Clear on exit');
    dispose();
  }

  @override
  void dispose() {
    print('[LIVING_NETWORK] : dispose');
    Provider.of<InternalProvider>(context).dispose();
    super.dispose();
  }

  Widget buildButton(String title, String image) {
    return Column(children: <Widget>[
      Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(image), fit: BoxFit.contain, alignment: Alignment.center),
            ),
          ),
          const SizedBox(
            width: 8.0,
          ),
          Text(title, style: LNStyle.map_button_selection)
        ],
      )
    ]);
  }
}
