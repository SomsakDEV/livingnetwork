import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/constance/LNColor.dart';
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

bool verify = false;

class _LivingNetworkState extends State<LivingNetwork> {
  static const platform = MethodChannel('LIVING_NETWORK');
  String token = 'UNKNOWN';

  @override
  void initState() {
    _wRequest();
    super.initState();
  }

  void _wRequest() async {
    platform.setMethodCallHandler((MethodCall call) async {
      try {
        print("[LIVING_NETWORK] Command : ${call.method}");
        if (call.method == 'open' && call.arguments != null) {
          verify = true;
        } else {
          print('[LIVING_NETWORK] check method or arg');
        }
      } on PlatformException catch (e, stacktrace) {
        print('[LIVING_NETWORK] Error Platform : $e,, $stacktrace');
      } on MissingPluginException catch (e, stacktrace) {
        print('[LIVING_NETWORK] Missing plugin : $e , $stacktrace');
      } catch (e, stacktrace) {
        print('[LIVING_NETWORK] Other error : $e , $stacktrace');
      } finally {
        if (verify) {
          setState(() {
            token = call.arguments;
          });
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
    return 'UNKNOWN' == token
        ? const CircularProgressIndicator(
            color: LNColor.primaryColor,
          )
        : MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => InternalProvider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(fontFamily: 'DB Heavent'),
              initialRoute: '/internal_test',
              routes: {
                '/internal_test': (context) => Mode5GInternal(token: token),
              },
            ),
          );
  }
}
