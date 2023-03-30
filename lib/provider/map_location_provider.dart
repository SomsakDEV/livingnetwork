import 'package:flutter/material.dart';

class MapLocationProvider with ChangeNotifier {
  String? _markerTab;

  String? get markerTab => _markerTab;

  void updateMarkerTab(String id) {
    _markerTab = id;
    notifyListeners();
  }
}
