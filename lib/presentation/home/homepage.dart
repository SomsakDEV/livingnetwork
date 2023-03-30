// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/presentation/home/tab_home.dart';
import 'package:living_network/presentation/home/tab_mobile.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // @override
  // void initState() {
  //   WidgetsBinding.instance.addPostFrameCallback(
  //     (_) => showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       builder: (context) {
  //         return FutureBuilder(
  //           future: Provider.of<LnProvider>(context, listen: false).prepareData(),
  //           builder: (context, snap) {
  //             if (snap.hasData && 'true' == snap.data.toString()) {
  //               return Dialog(
  //                 backgroundColor: LNColor.transparent,
  //                 child: Wrap(
  //                   children: [
  //                     Container(
  //                       decoration: const BoxDecoration(
  //                         color: LNColor.neutralsWhite,
  //                         borderRadius: BorderRadius.all(Radius.circular(10)),
  //                       ),
  //                       child: Column(
  //                         children: [
  //                           ClipRRect(
  //                             borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
  //                             child: Image.asset(
  //                               ImageUtils.getImagePath('assets/images/image.png'),
  //                               width: 260,
  //                             ),
  //                           ),
  //                           SizedBox(
  //                             height: 16,
  //                           ),
  //                           Text('5G Modes!', style: LNStyle.dialogHeader),
  //                           SizedBox(
  //                             height: 8,
  //                           ),
  //                           Text('Switch your connection mode to suite\nyour demand the most.', textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
  //                           SizedBox(
  //                             height: 16,
  //                           ),
  //                           Button(
  //                             textStyle: LNStyle.dialogButtonText,
  //                             title: "Got it",
  //                             buttonType: ButtonType.primaryBtn,
  //                             onPress: () {
  //                               Navigator.pop(context);
  //                             },
  //                             borderRadius: 6,
  //                             width: 236,
  //                             height: 36,
  //                           ),
  //                           SizedBox(
  //                             height: 16,
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               );
  //             } else if (snap.hasError || 'false' == snap.data.toString()) {
  //               return Dialog(
  //                 backgroundColor: LNColor.transparent,
  //                 child: Wrap(
  //                   children: [
  //                     Container(
  //                       padding: EdgeInsets.all(10),
  //                       decoration: const BoxDecoration(
  //                         color: LNColor.neutralsWhite,
  //                         borderRadius: BorderRadius.all(Radius.circular(10)),
  //                       ),
  //                       child: Column(
  //                         children: [
  //                           SizedBox(
  //                             height: 16,
  //                           ),
  //                           Text('Something wrong !!!', style: LNStyle.dialogHeader),
  //                           SizedBox(
  //                             height: 8,
  //                           ),
  //                           Text('Service is not ready. Please try again later', textAlign: TextAlign.center, style: LNStyle.dialogTitleText),
  //                           SizedBox(
  //                             height: 16,
  //                           ),
  //                           Button(
  //                             textStyle: LNStyle.dialogButtonText,
  //                             title: "Exit",
  //                             buttonType: ButtonType.primaryBtn,
  //                             onPress: () {
  //                               // SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
  //                               SystemNavigator.pop();
  //                             },
  //                             borderRadius: 6,
  //                             width: 236,
  //                             height: 36,
  //                           ),
  //                           SizedBox(
  //                             height: 16,
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                   ],
  //                 ),
  //               );
  //             } else {
  //               return Dialog(
  //                 backgroundColor: LNColor.transparent,
  //                 child: SizedBox(),
  //               );
  //             }
  //           },
  //         );
  //       },
  //     ),
  //   );
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Provider.of<LnProvider>(context).verify
        ? Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: false,
              title: const Text('Living Network', style: LNStyle.app_bar_style),
              backgroundColor: LNColor.whiteColor,
              leading: BackButton(
                color: LNColor.blackColor,
                onPressed: () => SystemNavigator.pop(),
              ),
            ),
            body: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50),
                  child: AppBar(
                    backgroundColor: Colors.white,
                    bottom: TabBar(
                      indicatorWeight: 4,
                      indicatorColor: Color(0xFF64CA00),
                      labelStyle: TextStyle(fontSize: 22),
                      labelColor: Color(0xFF64CA00),
                      unselectedLabelColor: Color(0xFF657884),
                      tabs: [
                        Tab(text: 'MOBILE'),
                        Tab(text: 'HOME'),
                      ],
                    ),
                  ),
                ),
                body: TabBarView(
                  children: [
                    TabMobile(),
                    TabHome(),
                  ],
                ),
              ),
            ),
          )
        : SizedBox();
  }
}
