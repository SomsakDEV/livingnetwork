import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/route.dart';

void main() => runApp(LivingNetworkmain());

class LivingNetworkmain extends StatefulWidget {
  @override
  State<LivingNetworkmain> createState() => _LivingNetworkmainState();
}

class _LivingNetworkmainState extends State<LivingNetworkmain> {
  static const platform = const MethodChannel('tonative');

  @override
  void initState() {
    super.initState();
    // _wRequest();
  }

  void _wRequest() async {
    Map<String, dynamic> data = <String, dynamic>{};
    platform.setMethodCallHandler((MethodCall call) async {
      print("Command : ${call.method}");
      switch (call.method.toLowerCase()) {
        case 'open':
          Navigator.pushNamed(context, '/livingnetwork');
          return '';
        // default:
        //   throw MissingPluginException();
      }
    });

    final res = await platform.invokeMethod('open');
    // data = Map<String,dynamic>.from(res);
    // todoResponse
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/livingnetwork/map',
      onGenerateRoute: (route) => RouteLivingNetwork().generateRoute(route),
    );
  }
}
