import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/presentation/home/homepage.dart';
import 'package:living_network_repository/data/model/userdata.dart';

import 'package:living_network_repository/data/repositories/repositories_impl.dart';
import 'package:living_network_repository/domain/entities/display_mode_widget.dart';
import 'package:living_network_repository/domain/usecase/get_data_catalog_usecase.dart';
import 'package:living_network_repository/main.reflectable.dart';
import 'package:core/core.dart';
import 'package:realm/realm.dart';

void main() async {
  initializeReflectable();
  WidgetsFlutterBinding.ensureInitialized();
  var coreConfig = CoreConfig(mode: Mode.debug);
  await coreConfig.checkOrGetConfig().whenComplete(() => IntiAppCionfig()
      .setInitAppConfig()
      .whenComplete(() => coreConfig.checkCacheConfig()));
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

  // late UserData userData = UserData(
  //   msisdn: "08123456789",
  //   networkType: "5G",
  //   cellId: "true",
  //   paymentType: "postpaid",
  //   modelType: "5G",
  //   customerState: "active",
  //   bssrule: "5G package",
  //   alarm: "true",
  //   eco: "true",
  // );

  @override
  void initState() {
    super.initState();
    final storagePath = Configuration.defaultStoragePath;
    print(storagePath);
    _wRequest();
  }

  void _wRequest() async {
    // platform.setMethodCallHandler((MethodCall call) async {
    // usecase?.getAddUserData(UserData('08123456789', '5G', 'true', 'postpaid',
    //     '5G', 'active', '5G package', 'true', 'true',
    //     isTemp: false));
    try {
      // print("[LIVING_NETWORK] Command : ${call.method}");
      // if (call.method == 'open' && call.arguments != null) {
      //   print("[LIVING_NETWORK] Input data : ${call.arguments}");
      //   token = call.arguments;
      if (usecase != null) {
        //for token query
        print("[LIVING_NETWORK] usecase : ${usecase.toString()}");
        final data =
            await usecase?.getDataAllUserDataWithRealmModel('08123456789');
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
        // } else {
        //   print('[LIVING_NETWORK] getDataAllUserDataWithRealmModel query fail');
        // }
      } else {
        print('[LIVING_NETWORK] GetDataCatalogUseCase is not define');
      }
      // } else {
      //   print('[LIVING_NETWORK] check method or arg');
      // }
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
    // });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
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
