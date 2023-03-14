import 'package:flutter/material.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';

class MainProvider with ChangeNotifier {
  int? social;
  int? videoStreaming;
  int? music;
  int? live;
  int? game;

  MainProvider({
    this.social,
    this.videoStreaming,
    this.music,
    this.live,
    this.game,
  });

  getData(DisplayScreen? data) {
    
  }
}
