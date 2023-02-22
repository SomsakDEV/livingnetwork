import 'dart:developer';

import 'package:core/config/cache_config.dart';
import 'package:core/core.dart';
import 'package:core/network/utils/constant.dart';
// import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:template/constance.dart';
import 'package:template/route.dart';
// ignore: depend_on_referenced_packages
import 'package:ui_style/ui_style.dart';

var localePref;
late BaseSharedPreference baseSharedPreference;
var langOnDevice;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // sharedPreferences = await SharedPreferences.getInstance();
  baseSharedPreference = BaseSharedPreference();
  var coreConfig = CoreConfig(mode: Mode.debug);
  // await coreConfig.checkOrGetConfig().whenComplete(() => IntiAppCionfig()
  // .setInitAppConfig()
  // .whenComplete(() => coreConfig.checkCacheConfig()));
  runApp(
      // RestartWidget(child:
      const MyApp()
      // )
      );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _configCache = CustomCacheConfig();
  @override
  void initState() {
    super.initState();
    langOnDevice = WidgetsBinding.instance.window.locales.first.toString().split("_").first;
    initLocalePref();
  }

  initLocalePref() async {
    localePref = await baseSharedPreference.getString("Locale");
    setState(() {
      localePref;
    });
    return localePref;
  }

  // Locale setLang() {
  //   bool check = false;
  //   if (localePref == null || localePref.toString() == "null") {
  //     for (var element in AppLocalizations.supportedLocales) {
  //       if (langOnDevice == element) {
  //         check = true;
  //       }
  //     }
  //     if (check) {
  //       return Locale(langOnDevice);
  //     } else {
  //       return const Locale("th");
  //     }
  //   } else {
  //     return Locale(localePref);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      // locale: setLang(),
      title: 'App Template',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'DB Heaven'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (route) => generateRoute(route),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String sesion = '';

  var menu = <PopupMenuItem>[
    const PopupMenuItem(
      value: "th",
      child: Text("Thailand"),
    ),
    const PopupMenuItem(
      value: "en",
      child: Text("English"),
    ),
    const PopupMenuItem(
      value: "km",
      child: Text("Cambodia"),
    ),
    const PopupMenuItem(
      value: "my",
      child: Text("Myanmar"),
    ),
    const PopupMenuItem(
      value: "zh",
      child: Text("China"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          UiPopupMenuButton(
            menu: menu,
            icon: const Icon(Icons.language, color: BaseColors.greyColor),
            onSelected: (value) async {
              // await baseSharedPreference.setString("Locale", value.toString());
              // localePref = await baseSharedPreference.getString("Locale");
              // RestartWidget.restartApp(context);
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // const UiDividerWithText(title: "Applocalization"),
                // const SizedBox(height: 5),
                UiButton(
                  title: "Living Network",
                  buttonType: ButtonType.secondaryBtn,
                  onPress: () {
                    Navigator.pushNamed(context, "/mapdemo");
                  },
                ),
                UiButton(
                  title: "Test Core http",
                  buttonType: ButtonType.secondaryBtn,
                  onPress: () {
                    Navigator.pushNamed(context, "/testhttp");
                  },
                ),
                UiButton(
                  title: "Test Core WS",
                  buttonType: ButtonType.secondaryBtn,
                  onPress: () {
                    Navigator.pushNamed(context, "/testsw");
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/my_module');
                    },
                    child: const Text('my_module')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/ListviewIndexPreloadScreen');
                    },
                    child: const Text('Listview Index Preload Screen')),
                UiButton(
                  title: "Test Core Media",
                  buttonType: ButtonType.secondaryBtn,
                  onPress: () {
                    Navigator.pushNamed(context, "/testCacheMedia");
                  },
                ),

                UiButton(
                  title: "Network External",
                  buttonType: ButtonType.secondaryBtn,
                  onPress: () {
                    Navigator.pushNamed(context, "/networkExt");
                  },
                ),
                // const NomodelDioButton(),
                // const GraphqlButton(),

                UiButton(
                  title: "Go to Preview Screen",
                  buttonType: ButtonType.secondaryBtn,
                  onPress: () {
                    Navigator.pushNamed(context, "/preview");
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  dependency,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  addDependency,
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.black,
                ),
                Image.asset('assets/images/setup_dependency.png'),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  width: double.infinity,
                  child: Text(addUrl),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  width: double.infinity,
                  child: Text(addRef),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, top: 5.0),
                  width: double.infinity,
                  child: Text(addPath),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15.0, top: 5.0),
                  width: double.infinity,
                  child: Text(dependencyPs),
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.black,
                ),
                Text(
                  route,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  addRoute,
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.black,
                ),
                Image.asset('assets/images/setup_route.png'),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  width: double.infinity,
                  child: Text(condition),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                  width: double.infinity,
                  child: Text(routePs),
                ),
                const Divider(
                  thickness: 1.0,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
