import 'package:flutter/material.dart';
import 'package:living_network/living_network.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_main.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_main_home.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_main_mobile.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_noon.dart';
import 'package:living_network/map_screen/map_screen.dart';
import 'package:living_network/map_screen/map_widget.dart';

class RouteLivingNetwork {
  Route? getLivingNetworkRoute(RouteSettings route, Route? currentRoute) {
    switch (route.name) {
      case '/my_widget':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyWidget(),
        );
      case '/mapdemo':
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
              LivingNetwork(network: args?['network'], phone: args?['phone']),
        );
      case '/livingnetwork/noon':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LivingNetworkNoon(),
        );
    }
    return currentRoute;
  }
}
