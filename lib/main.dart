import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/model/mode/mode_customer.dart';
import 'package:living_network/presentation/home/homepage.dart';
import 'package:living_network/presentation/home/tab_mobile.dart';
import 'package:living_network/route.dart';
import 'package:living_network_repository/data/repositories/repositories_impl.dart';
import 'package:living_network_repository/domain/usecase/get_data_catalog_usecase.dart';
import 'package:living_network_repository/main.reflectable.dart';
import 'package:realm/realm.dart';
import 'package:core/core.dart';

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
  String? token;
  late UserData userData;

  @override
  void initState() {
    super.initState();
    _wRequest();
  }

  void _wRequest() async {
    final customer =
        await usecase?.getDataAllUserDataWithRealmModel('08123456789');

    if (customer!.isNotEmpty) {
      var data = customer[0];
      userData = UserData(
          msisdn: data.msisdn,
          networkType: data.networkType,
          cellId: data.cellId,
          paymentType: data.paymentType,
          modelType: data.modelType,
          customerState: data.customerState,
          bssrule: data.bssrule,
          alarm: data.alarm,
          eco: data.eco);
      verify = true;
    } else {
      throw MissingPluginException();
    }

    // platform.setMethodCallHandler((MethodCall call) async {
    //   try {
    //     print("[LIVING_NETWORK] Command : ${call.method}");
    //     if (call.method == 'open' && call.arguments != null) {
    //       print("[LIVING_NETWORK] Input data : ${call.arguments}");
    //       token = call.arguments;
    //       verify = true;
    //     } else {
    //       throw MissingPluginException();
    //     }
    //   } on PlatformException catch (e) {
    //     print('[LIVING_NETWORK] Error Platform : $e');
    //   } on MissingPluginException catch (e) {
    //     print('[LIVING_NETWORK] Missing plugin : $e');
    //   } catch (e) {
    //     print('[LIVING_NETWORK] Other error : $e');
    //   } finally {
    //     if (verify) {
    //       platform.invokeMethod('open', ['Success : $token']);
    //     } else {
    //       platform.invokeMethod('open', ['Page cant not open']);
    //       SystemNavigator.pop();
    //     }
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (contxt) => HomePage(
              userData: userData,
            ),
      },
      theme: ThemeData(fontFamily: 'DB Heavent'),
      // initialRoute: '/livingnetwork/map',
      onGenerateRoute: (route) => RouteLivingNetwork().generateRoute(route),
    );
  }
}
