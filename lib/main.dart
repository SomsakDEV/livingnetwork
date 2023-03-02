import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/living_network/presentation/pages/lvnw_main_mobile.dart';
import 'package:living_network/route.dart';

void main() => runApp(LivingNetworkmain());

class LivingNetworkmain extends StatefulWidget {
  @override
  State<LivingNetworkmain> createState() => _LivingNetworkmainState();
}

bool verify = false;

class _LivingNetworkmainState extends State<LivingNetworkmain> {
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
        print("Command : ${call.method}");
        if (call.method == 'open' && call.arguments != null) {
          print("Input data : ${call.arguments}");
          token = call.arguments;
        } else {
          throw MissingPluginException();
        }
      } on PlatformException catch (e) {
        print('Error Platform : $e');
      } on MissingPluginException catch (e) {
        print('Missing plugin : $e');
      } catch (e) {
        print('Other error : $e');
      } finally {
        if (verify) {
          platform.invokeMethod('open', ['Success : $token']);
        } else {
          platform.invokeMethod('open', ['Page cant not open']);
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      initialRoute: LivingNetworkMobile.ROUTE_NAME,
      theme: ThemeData(fontFamily: 'DB Heavent'),
      // initialRoute: '/livingnetwork/map',
      onGenerateRoute: (route) => RouteLivingNetwork().generateRoute(route),
    );
  }
}
