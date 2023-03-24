// ignore_for_file: prefer_const_constructors , prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:living_network/component/mode/mode_widget.dart';
import 'package:living_network/constance/LNColor.dart';
import 'package:living_network/constance/LNStyle.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:provider/provider.dart';

class Mode5GInternal extends StatefulWidget {
  String token;

  Mode5GInternal({Key? key, required this.token}) : super(key: key);

  @override
  State<Mode5GInternal> createState() => _Mode5GInternalState();
}

class _Mode5GInternalState extends State<Mode5GInternal> {
  @override
  void initState() {
    print('[LIVING_NETWORK] Verify : ${Provider.of<InternalProvider>(context, listen: false).internalPrepare(widget.token)}');
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
