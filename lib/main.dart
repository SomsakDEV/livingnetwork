import 'package:flutter/material.dart';
import 'package:living_network/presentation/home/homepage.dart';
import 'package:living_network/presentation/map/map_direction.dart';
import 'package:living_network/presentation/map/map_screen.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(LivingNetwork());
}

class LivingNetwork extends StatefulWidget {
  @override
  State<LivingNetwork> createState() => _LivingNetworkState();
}

class _LivingNetworkState extends State<LivingNetwork> {
  String? token;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => MainProvider(repo: repo, tmp: repo?.getMockupData())),
        ChangeNotifierProvider(create: (context) => LnProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DB Heavent'),
        initialRoute: '/',
        routes: {
          // '/': (context) => TabHome()
          '/': (context) => HomePage(),
          '/map': (context) => MapScreen(),
          '/map/direction': (context) => MapDirection(),
        },
      ),
    );
  }
}
