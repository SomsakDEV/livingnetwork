import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:living_network/living_network.dart';
import 'package:preview/preview.dart';

// import 'package:my_module/my_module.dart';

import 'main.dart';

Route? _route;

///```
/// This function was called on onGenerateRoute (collect all route in every module).
///```
Route<dynamic>? generateRoute(RouteSettings route) {
  _route = getHomepageRoute(route, _route);
  _route = getNeworkRoute(route, _route);
  _route = getPreviewRoute(route, _route);
  _route = RouteLivingNetwork().getLivingNetworkRoute(route, _route);
  // _route = getMyModule(route, _route);

  if (_route != null) {
    return _route;
  }

  return MaterialPageRoute(
    builder: (_) => Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
      ),
      body: const Center(
        child: Text('Page not found'),
      ),
    ),
  );
}

Route? getHomepageRoute(RouteSettings route, Route? currentRoute) {
  if (route.name == '/') {
    return PageRouteBuilder(
        settings: route,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const MyHomePage(title: 'Template'));
  } else {
    return currentRoute;
  }
}

Route? getNeworkRoute(RouteSettings route, Route? currentRoute) {
  switch (route.name) {
    case '/testhttp':
      return PageRouteBuilder(
        settings: route,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TestHttpScreen(),
      );
    case '/testsw':
      return PageRouteBuilder(
        settings: route,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TestSWScreen(),
      );

    // case '/graphqltest':
    //   return PageRouteBuilder(
    //     settings: route,
    //     pageBuilder: (context, animation, secondaryAnimation) =>
    //         const ViewUserScreen(),
    //   );

    case '/ListviewIndexPreloadScreen':
      return PageRouteBuilder(
        settings: route,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const ListviewIndexPreloadScreen(),
      );
    case '/testCacheMedia':
      return PageRouteBuilder(
        settings: route,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const TestCoreMedia2(),
      );
    case '/networkExt':
      return PageRouteBuilder(
        settings: route,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const NetworkExtScreen(),
      );
  }
  return currentRoute;
}

Route? getPreviewRoute(RouteSettings route, Route? currentRoute) {
  switch (route.name) {
    case '/preview':
      return PageRouteBuilder(
        settings: route,
        pageBuilder: (context, animation, secondaryAnimation) =>
            const PreviewScreen(),
      );
  }
  return currentRoute;
}
