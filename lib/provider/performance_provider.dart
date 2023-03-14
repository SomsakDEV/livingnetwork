import 'package:flutter/material.dart';

class PerformanceProvider with ChangeNotifier {
  int? social;
  int? videoStreaming;
  int? music;
  int? live;
  int? game;

  PerformanceProvider({
    this.social,
    this.videoStreaming,
    this.music,
    this.live,
    this.game,
  });

  getData() {
    
  }
}
