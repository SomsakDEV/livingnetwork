import 'package:flutter/material.dart';
import 'package:living_network/component/mode/button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClearData extends StatefulWidget {
  static const ROUTE_NAME = '/livingnetwork/clearData';

  const ClearData({super.key});

  @override
  State<ClearData> createState() => _ClearDataState();
}

class _ClearDataState extends State<ClearData> {
  final Future<SharedPreferences> _data = SharedPreferences.getInstance();

  void clearData() async {
    final SharedPreferences data = await _data;
    data.clear();
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        // appBar: AppBar(
        //   title: const Text('Clear Data'),
        // ),
        Card(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Button(
          width: MediaQuery.of(context).size.width * 0.95,
          height: 45,
          title: 'Clear Data',
          buttonType: ButtonType.primaryBtn,
          onPress: () {
            clearData();
          },
        ),
      ]),
    );
  }
}
