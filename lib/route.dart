import 'package:flutter/material.dart';
import 'package:living_network/living_network.dart';

class RouteLivingNetwork {
  Route? getLivingNetworkRoute(RouteSettings route, Route? currentRoute) {
    switch (route.name) {
      case '/my_widget':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const MyWidget(),
        );
    }
    return currentRoute;
  }
}
