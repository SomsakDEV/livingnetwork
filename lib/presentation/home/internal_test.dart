import 'package:flutter/material.dart';
import 'package:living_network/component/mode/mode_widget.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:provider/provider.dart';

class Mode5GInternal extends StatefulWidget {
  Mode5GInternal({
    Key? key,
  }) : super(key: key);

  @override
  State<Mode5GInternal> createState() => _Mode5GInternalState();
}

class _Mode5GInternalState extends State<Mode5GInternal> {
  // @override
  // void initState() {
  //   print('Verify : ${Provider.of<InternalProvider>(context, listen: false).internalPrepare()}');
  //   super.initState();
  // }

  /*@override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return FutureBuilder(
            future: Provider.of<InternalProvider>(context, listen: false).internalPrepare(),
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
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: LNColor.transparent,
                      image: DecorationImage(
                        image: AssetImage('assets/test.gif'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }
            },
          );
        },
      ),
    );
    super.initState();
  }*/

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('5G Mode', style: LNStyle.modeWidgetTitle),
        backgroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        color: LNColor.primaryColor,
        onRefresh: () => Provider.of<InternalProvider>(context, listen: false).internalPrepare(),
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
    );
  }
}
