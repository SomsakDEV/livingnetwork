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
            future: Provider.of<InternalProvider>(context, listen: false).internalPrepare(),
            builder: (context, snap) {
              if (snap.hasData && 'true' == snap.data.toString()) {
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
                              borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                              child: Image.asset(
                                ImageUtils.getImagePath('assets/images/image.png'),
                                width: 260,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Text('5G Modes!', style: LNStyle.dialogHeader),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text('Switch your connection mode to suite\nyour demand the most.', textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
                            const SizedBox(
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
                            const SizedBox(
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
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: LNColor.neutralsWhite,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            const Text('Something wrong !!!', style: LNStyle.dialogHeader),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text('Service is not ready. Please try again later', textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
                            const SizedBox(
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
                            const SizedBox(
                              height: 16,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Dialog(
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
                    decoration: BoxDecoration(color: const Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(8), border: Border.all(width: 3, color: const Color(0xFFF0F0F0))),
                    width: w * 0.93,
                    child: ModeWidget(),
                  ),
                  Text(
                    'Detected Network Type : ${Provider.of<InternalProvider>(context, listen: true).status}',
                    style: const TextStyle(color: LNColor.failColor, fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left : 15.0),
                    child: Text(
                      'Data : ${Provider.of<InternalProvider>(context, listen: true).mode == null ? "" : Provider.of<InternalProvider>(context, listen: true).mode!.toJson()}',
                      style: const TextStyle(color: LNColor.failColor, fontSize: 15),
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
