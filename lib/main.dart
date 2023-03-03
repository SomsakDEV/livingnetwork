import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/presentation/home/tab_mobile.dart';
import 'package:living_network/route.dart';

void main() => runApp(LivingNetwork());

class LivingNetwork extends StatefulWidget {
  @override
  State<LivingNetwork> createState() => _LivingNetworkState();
}

bool verify = false;

class _LivingNetworkState extends State<LivingNetwork> {
  static const platform = MethodChannel('LIVING_NETWORK');
  String? token;

  @override
  void initState() {
    super.initState();
    _wRequest();
  }

  void _wRequest() async {
    platform.setMethodCallHandler((MethodCall call) async {
      try {
        print("[LIVING_NETWORK] Command : ${call.method}");
        if (call.method == 'open' && call.arguments != null) {
          print("[LIVING_NETWORK] Input data : ${call.arguments}");
          token = call.arguments;
        } else {
          throw MissingPluginException();
        }
      } on PlatformException catch (e) {
        print('[LIVING_NETWORK] Error Platform : $e');
      } on MissingPluginException catch (e) {
        print('[LIVING_NETWORK] Missing plugin : $e');
      } catch (e) {
        print('[LIVING_NETWORK] Other error : $e');
      } finally {
        if (verify) {
          platform.invokeMethod('open', ['Success : $token']);
        } else {
          platform.invokeMethod('open', ['Page cant not open']);
          SystemNavigator.pop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: TabMobile.ROUTE_NAME,
      theme: ThemeData(fontFamily: 'DB Heavent'),
      // initialRoute: '/livingnetwork/map',
      onGenerateRoute: (route) => RouteLivingNetwork().generateRoute(route),
    );
  }
}
