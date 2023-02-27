import 'package:flutter/material.dart';
import 'package:living_network/living_network/presentation/pages/clearData.dart';
import 'package:living_network/living_network/presentation/pages/lvnw_main.dart';
import 'package:living_network/map_direction/md_main.dart';
import 'package:living_network/map_screen/map_screen.dart';

class RouteLivingNetwork {
  Route? getLivingNetworkRoute(RouteSettings route, Route? currentRoute) {
    switch (route.name) {
      case '/livingnetwork/map':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MapScreen(),
        );
      case '/livingnetwork':
        final args = route.arguments as Map?;
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LivingNetwork(),
        );
      case '/map_direction':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MapDirection(),
        );
      case '/livingnetwork/clearData':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
          const ClearData(),
        );
    }
    return currentRoute;
  }
}
