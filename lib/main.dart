import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/model/mode/mode_customer.dart';
import 'package:living_network/presentation/home/homepage.dart';
import 'package:living_network/presentation/home/tab_home.dart';
// import 'package:living_network_repository/data/repositories/repositories_impl.dart';
// import 'package:living_network_repository/domain/usecase/get_data_catalog_usecase.dart';
// import 'package:living_network_repository/main.reflectable.dart';
// import 'package:core/core.dart';

void main() async {
  // initializeReflectable();
  // WidgetsFlutterBinding.ensureInitialized();
  // var coreConfig = CoreConfig(mode: Mode.debug);
  // await coreConfig.checkOrGetConfig().whenComplete(() => IntiAppCionfig().setInitAppConfig().whenComplete(() => coreConfig.checkCacheConfig()));
  runApp(LivingNetwork());
}

class LivingNetwork extends StatefulWidget {
  @override
  State<LivingNetwork> createState() => _LivingNetworkState();
}

bool verify = false;

class _LivingNetworkState extends State<LivingNetwork> {
  // static const platform = MethodChannel('LIVING_NETWORK');
  // GetDataCatalogUseCase? usecase = GetDataCatalogUseCase(RepositoriesImpl());
  late final customer;
  String? token;
  late UserData userData;

  @override
  void initState() {
    super.initState();
    // _wRequest();
  }

  // void _wRequest() async {
  //   platform.setMethodCallHandler((MethodCall call) async {
  //     try {
  //       print("[LIVING_NETWORK] Command : ${call.method}");
  //       if (call.method == 'open' && call.arguments != null) {
  //         print("[LIVING_NETWORK] Input data : ${call.arguments}");
  //         token = call.arguments;
  //         if (usecase != null) {
  //           //for token query
  //           print("[LIVING_NETWORK] usecase : ${usecase.toString()}");
  //           customer = await usecase?.getDataAllUserDataWithRealmModel('08123456789');
  //           if (customer.isNotEmpty) {
  //             print("[LIVING_NETWORK] customer : ${customer.toString()}");
  //             var data = customer[0];
  //             print("[LIVING_NETWORK] data : ${data.toString()}");
  //             userData = UserData(
  //               msisdn: data.msisdn ?? "unknown",
  //               networkType: data.networkType ?? "unknown",
  //               cellId: data.cellId ?? "unknown",
  //               paymentType: data.paymentType ?? "unknown",
  //               modelType: data.modelType ?? "unknown",
  //               customerState: data.customerState ?? "unknown",
  //               bssrule: data.bssrule ?? "unknown",
  //               alarm: data.alarm ?? "unknown",
  //               eco: data.eco ?? "unknown",
  //             );
  //             verify = true;
  //           } else {
  //             print('[LIVING_NETWORK] getDataAllUserDataWithRealmModel query fail');
  //           }
  //         } else {
  //           print('[LIVING_NETWORK] GetDataCatalogUseCase is not define');
  //         }
  //       } else {
  //         print('[LIVING_NETWORK] check method or arg');
  //       }
  //     } on PlatformException catch (e) {
  //       print('[LIVING_NETWORK] Error Platform : $e');
  //     } on MissingPluginException catch (e) {
  //       print('[LIVING_NETWORK] Missing plugin : $e');
  //     } catch (e) {
  //       print('[LIVING_NETWORK] Other error : $e');
  //     } finally {
  //       if (verify) {
  //         platform.invokeMethod('open', ['Success : $token']);
  //       } else {
  //         platform.invokeMethod('open', ['Page cant not open']);
  //         SystemNavigator.pop();
  //       }
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'DB Heavent'),
      initialRoute: '/',
      routes: {
    '/': (context) => TabHome()
        // '/': (context) => HomePage(
        //       userData: userData,
        //     ),
      },
    );
  }
}
