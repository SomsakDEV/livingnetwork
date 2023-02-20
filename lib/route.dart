import 'package:flutter/material.dart';
import 'package:living_network/living_network.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_main.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_main_home.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_main_mobile.dart';
import 'package:living_network/livingnetwork/presentation/pages/lvnw_noon.dart';
import 'package:living_network/map_screen/map_screen.dart';
import 'package:living_network/map_screen/map_widget.dart';
import 'package:living_network/mode_screen/4g_phone_4g_pack.dart';
import 'package:living_network/mode_screen/4g_phone_5g_pack.dart';
import 'package:living_network/mode_screen/5g_phone_4g_pack.dart';
import 'package:living_network/mode_screen/5g_phone_5g_pack.dart';
import 'package:living_network/mode_screen/mode_widget.dart';

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
      case '/mode_widget':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const ModeWidget(),
        );
      case '/4G4G':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const FourGPhoneFourGPackage(),
        );
      case '/4G5G':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const FourGPhoneFiveGPackage(),
        );
      case '/5G4G':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const FiveGPhoneFourGPackage(),
        );
      case '/5G5G':
        return PageRouteBuilder(
          settings: route,
          pageBuilder: (context, animation, secondaryAnimation) =>
              const FiveGPhoneFiveGPackage(),
        );
    }
    return currentRoute;
  }
}
