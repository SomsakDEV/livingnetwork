import 'package:flutter/material.dart';

import 'package:living_network_repository/function_a.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Web')),
      body: Center(
        child: Text(FunctionA().testFunction()),
      ),
    );
  }
}
