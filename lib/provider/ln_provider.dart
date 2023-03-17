import 'package:flutter/material.dart';
import 'package:living_network_repository/data/repositories/repositories_impl.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class LnProvider with ChangeNotifier {
  GetDataCatalogUseCase? repo;
  late bool _verify = false;
  DisplayScreen? _displayScreen;
  Perform? _perform;
  Mode5G? _mode;
  LocationWifi? _locationWifi;

  LocationWifi? get locationWifi => _locationWifi;
  LocationShop? _locationShop;

  LocationShop? get locationShop => _locationShop;

  bool get verify => _verify;

  DisplayScreen? get displayScreen => _displayScreen;

  Mode5G? get mode => _mode;

  Perform? get perform => _perform;

  Future<bool> prepareData() async {
    repo = repo ?? GetDataCatalogUseCase(RepositoriesImpl());
    try {
      repo?.getCleanCache();
      _displayScreen = await repo?.getMockupData('08123456789');
      if (_verify = (_displayScreen != null)) {
        _perform = _displayScreen?.perform;
        _mode = _displayScreen?.mode;
        _locationWifi = _displayScreen?.locationWifi;
        _locationShop = _displayScreen?.locationShop;
      }
    } catch (e, st) {
      print('ERROR : $e  : $st');
    }
    print('_verify Data : $_verify');
    notifyListeners();
    return _verify;
  }

  Future<void> loadPerformance() async {
    repo = repo ?? GetDataCatalogUseCase(RepositoriesImpl());
    _perform = await repo?.getPerformance();
    notifyListeners();
  }

  Future<void> loadMode5G() async {
    repo = repo ?? GetDataCatalogUseCase(RepositoriesImpl());
    // _locations = await repo?.getLocation();
    notifyListeners();
  }

  Future<void> loadData() async {
    repo = repo ?? GetDataCatalogUseCase(RepositoriesImpl());
    DisplayScreen? tmp = await repo?.getMockupData('6412c106d0cefc3a4583db11');
    _displayScreen = tmp ?? _displayScreen;
    print('Mode : ${_displayScreen?.mode?.toJson()}');
    print('perform : ${_displayScreen?.perform?.toJson()}');
    print('perform : ${_displayScreen?.locationWifi?.toJson()}');
    print('perform : ${_displayScreen?.locationShop?.toJson()}');
    notifyListeners();
  }
}
