import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/presentation/home/homepage.dart';
import 'package:living_network_repository/data/repositories/repositories_impl.dart';
import 'package:living_network_repository/domain/entities/display_mode_widget.dart';
import 'package:living_network_repository/domain/usecase/get_data_usecase.dart';

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
  GetDataCatalogUseCase? usecase = GetDataCatalogUseCase(RepositoriesImpl());
  late DisplayModeWidget customer = DisplayModeWidget();
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
          if (usecase != null) {
            print("[LIVING_NETWORK] usecase : ${usecase.toString()}");
            final data = await usecase?.getDataAllUserDataWithRealmModel('08123456789');
            customer = data!;
            print("mode ${data.mode}");
            print("expireLiveMode ${data.expireLiveMode}");
            print("expireGameMode ${data.expireGameMode}");
            print("isDisableMode ${data.isDisableMode}");
            print("isDisableModeEco ${data.isDisableModeEco}");
            print("isDisableModeLive ${data.isDisableModeLive}");
            print("isDisableModeGame ${data.isDisableModeGame}");
            print("isLive ${data.isLive}");
            print("isGame ${data.isGame}");
            print("[LIVING_NETWORK] data : ${data.toString()}");
            verify = true;
          } else {
            print('[LIVING_NETWORK] GetDataCatalogUseCase is not define');
          }
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
          SystemNavigator.pop();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'DB Heavent'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(
              display: customer,
            ),
      },
    );
  }
}
