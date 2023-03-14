import 'package:flutter/material.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';

class MainProvider with ChangeNotifier {
  dynamic displayScreen;

  MainProvider({
    this.displayScreen,
  });

  setData(Future<DisplayScreen>? data) {
    displayScreen = data;
    notifyListeners();
  }

  getData() {
    return displayScreen.getPerform;
  }
}
