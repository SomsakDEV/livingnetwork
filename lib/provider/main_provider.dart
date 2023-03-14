import 'package:flutter/material.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';

class MainProvider with ChangeNotifier {
  Future<DisplayScreen>? displayScreen1;
  DisplayScreen? displayScreen;

  MainProvider({
    this.displayScreen1,
    this.displayScreen
  });

  Future<String>? getGame() async {
    final s = await displayScreen1;
    displayScreen = DisplayScreen(perform: s?.perform);
    print(displayScreen);
    return "sss";  
  }

}
