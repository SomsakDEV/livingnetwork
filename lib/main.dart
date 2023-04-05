import 'package:flutter/material.dart';
import 'package:living_network/presentation/home/internal_test.dart';
import 'package:living_network/provider/internal_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(LivingNetwork());
}

class LivingNetwork extends StatefulWidget {
  @override
  State<LivingNetwork> createState() => _LivingNetworkState();
}

class _LivingNetworkState extends State<LivingNetwork> {
  String token = "5Gtessssssssst";

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => MainProvider(repo: repo, tmp: repo?.getMockupData())),
        ChangeNotifierProvider(create: (context) => InternalProvider()),
        // ChangeNotifierProvider(create: (context) => LnProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DB Heavent'),
        // initialRoute: '/internal_test',
        initialRoute: '/internal_test',
        routes: {
          // '/': (context) => HomePage(),
          // '/map': (context) => MapScreen(),
          // '/map/direction': (context) => MapDirection(),
          '/internal_test': (context) => Mode5GInternal(token: token),
        },
      ),
    );
  }
}
