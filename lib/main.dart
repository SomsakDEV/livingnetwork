import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network/presentation/home/homepage.dart';
import 'package:living_network/provider/performance_provider.dart';

import 'package:living_network_repository/data/repositories/repositories_impl.dart';
import 'package:living_network_repository/domain/entities/display_mode_widget.dart';
import 'package:living_network_repository/domain/usecase/get_data_usecase.dart';

import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

void main() async {
  runApp(LivingNetwork());
}

// ignore: use_key_in_widget_constructors
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
    super.initState();
    final storagePath = Configuration.defaultStoragePath;
    print(storagePath);
    _wRequest();
  }

  void _wRequest() async {
    try {
      print("[LIVING_NETWORK] usecase : ${usecase.toString()}");
      final data = await usecase?.getMockupData();

      print("mode ${data?.perform}");
      print("[LIVING_NETWORK] data : ${data.toString()}");

      PerformanceProvider().getData(data);
    } on PlatformException catch (e) {
      print('[LIVING_NETWORK] Error Platform : $e');
    } on MissingPluginException catch (e) {
      print('[LIVING_NETWORK] Missing plugin : $e');
    } catch (e) {
      print('[LIVING_NETWORK] Other error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PerformanceProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'DB Heavent'),
        initialRoute: '/',
        routes: {
          // '/': (context) => TabHome()
          '/': (context) => HomePage(),
        },
      ),
    );
  }
}
