// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/component/mode/button.dart';
import 'package:living_network/component/mode/mode_widget.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:provider/provider.dart';

class Mode5GInternal extends StatefulWidget {
  Mode5GInternal({
    Key? key,
  }) : super(key: key);

  @override
  State<Mode5GInternal> createState() => _Mode5GInternalState();
}

class _Mode5GInternalState extends State<Mode5GInternal> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return FutureBuilder(
            future: Provider.of<LnProvider>(context, listen: false).prepareData(),
            builder: (context, snap) {
              if (snap.hasData && 'true' == snap.data.toString()) {
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
                            Text('Initial Success', style: LNStyle.dialogHeader),
                            SizedBox(
                              height: 8,
                            ),
                            Button(
                              textStyle: LNStyle.dialogButtonText,
                              title: "OK",
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
                                // SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
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
    return Consumer<LnProvider>(
      builder: (context, data, _) => Scaffold(
        body: RefreshIndicator(
          color: LNColor.primaryColor,
          onRefresh: () => data.loadData(),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Text('Living Gokogo Network room studio YEAHHHH',style: LNStyle.header1,),
                    // Container(
                    //   height: h * 0.35,
                    //   child: ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)), child: Image.asset(ImageUtils.getImagePath('assets/images/image.png'))),
                    // ),
                    SizedBox(
                      height: h * 0.3,
                    ),
                    Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8), border: Border.all(width: 3, color: Color(0xFFF0F0F0))),
                      width: w * 0.93,
                      child: ModeWidget(),
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
      ),
    );
  }
}
