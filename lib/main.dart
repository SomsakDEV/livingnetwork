import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/presentation/home/homepage.dart';
import 'package:living_network/presentation/map/map_direction.dart';
import 'package:living_network/presentation/map/map_screen.dart';
import 'package:living_network/provider/ln_provider.dart';
import 'package:living_network_repository/data/repositories/repositories_impl.dart';
import 'package:living_network_repository/domain/entities/display_mode_widget.dart';
import 'package:living_network_repository/domain/usecase/get_data_usecase.dart';
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
  String? token;

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
          print('Yo3');
          print("[LIVING_NETWORK] Input data : ${call.arguments}");
          token = call.arguments;
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
          platform.invokeMethod('open', ['Success : $token']);
        } else {
          platform.invokeMethod('open', ['Page cant not open']);
          // SystemNavigator.pop();
        }
      }
    });
  }

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
          '/': (context) => HomePage(),
          '/map': (context) => MapScreen(),
          '/map/direction': (context) => MapDirection(),
        },
      ),
    );
  }
}
