import 'package:flutter/material.dart';
import 'package:living_network/mode_screen/routes.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/mode_widget',
      routes: routes,
    );
  }
}
