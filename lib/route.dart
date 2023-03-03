import 'package:flutter/material.dart';
import 'package:living_network/presentation/home/homepage.dart';

// import 'package:living_network/map_screen/map_screen.dart';

class RouteLivingNetwork {
  Route? _route;

  Route<dynamic>? generateRoute(RouteSettings route) {
    _route = getLivingNetworkRoute(route, _route);
    if (_route != null) {
      return _route;
    } else {
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
  }

  Route? getLivingNetworkRoute(RouteSettings route, Route? currentRoute) {
    switch (route.name) {
      // case '/livingnetwork/map':
      //   return PageRouteBuilder(
      //     settings: route,
      //     pageBuilder: (context, animation, secondaryAnimation) => const MapScreen(),
      //   );
      case '/livingnetwork':
        // final args = route.arguments as Map?;
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
        );
      // case '/map_direction':
      //   return PageRouteBuilder(
      //     settings: route,
      //     pageBuilder: (context, animation, secondaryAnimation) =>
      //         const MapDirection(),
      //   );
    }
    return currentRoute;
  }
}
