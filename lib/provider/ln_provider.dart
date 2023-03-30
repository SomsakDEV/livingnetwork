import 'package:flutter/material.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class LnProvider with ChangeNotifier {
  InitialData? repo;
  InitialInternal? repo1;
  late bool _verify = false;
  late bool _isDisable = false;
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

  bool get isDisable => _isDisable;

  void setIsDisable(bool s){
    _isDisable = s;
  }

  final String token =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjlVeTRLUjlzOEoifQ.eyJpc3MiOiJzcmYuYWlzLmNvLnRoL2FkbWQiLCJzdWIiOiJ0b2tlbl9jbGllbnRfY3JlZGVudGlhbHMiLCJhdWQiOiJTVzhMaUdGd3dqQmJ0eDd0d2c3Z2dhZHVxL2VlZzhFM2c3dmtrVlNCVis5aVpxZkRsbERqMnc9PSIsImV4cCI6MTk4NzI3MTE2MywiaWF0IjoxNjcxNzAxNjQzLCJqdGkiOiI0RjhBaUM1S1VzT3gyeDQ3UzhlOGJKIiwiY2xpZW50IjoiT1RBd01EQXdNREF3TURBd05qWXpMRzE1WVdsemZFSmhZMnRsYm1SOE1TNHdMakE9Iiwic3NpZCI6IjNxNGlmMWVaMTF4NkdDSzRPWGQ4VUIifQ.d64EmMj1NQEE1yciOZwVrdS7gAeD6A-gQb3SOHkAuap2vgcBTi07G_WvX5Q2gVlGlttq-j05S1Qp6LNKl3vo-DqKXhc5PpmYK6pMxDiur_97OBB2ePAdcJJRpMNQUBmLOXIFPKxKN4WP6mRTVCkayqso1G_v0cILtIpPokvFHOc";

  Future<bool> prepareData() async {
    repo = repo ?? InitialData();
    try {
      repo?.getCleanCache();
      WidgetsFlutterBinding.ensureInitialized();
      var coreConfig = CoreConfig(mode: Mode.debug);
      await coreConfig.checkOrGetConfig().whenComplete(() => IntiAppCionfig().setInitAppConfig().whenComplete(() => coreConfig.checkCacheConfig()));
      _displayScreen = await repo?.getMockupData('0889081797');
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
    return true;
  }

  Future<String> updateMode5G(
      MsisdnMode? msisdnDB, CheckModeProfile? checkModeProfile) async {
      repo1 = repo1 ?? InitialInternal();
      _mode = await repo?.updateMsisdn(msisdnDB, checkModeProfile);
      print('Mode reload  : ${_mode?.toJson()}');
      notifyListeners();
      if(_isDisable) {
        _isDisable = false;
      }
      return "Success";
  }

  Future<bool> internalPrepare() async {
    // repo = repo ?? GetDataCatalogUseCase(RepositoriesImpl());
    _mode = await repo?.getMode(token);
    print('Mode : ${_mode?.toJson()}');
    notifyListeners();
    return _verify = (_mode != null);
  }

  Future<void> loadMode5G() async {
    repo = repo ?? InitialData();
    _mode =  await repo?.getMode(token);
    print('Mode reload  : ${_displayScreen?.mode?.toJson()}');
    notifyListeners();
  }

  Future<void> loadPerformance() async {
    repo = repo ?? InitialData();
    _perform = await repo?.getPerformance('08123456789');
    notifyListeners();
  }

  Future<void> loadData() async {
    repo = repo ?? InitialData();
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
    print('Mode : ${_displayScreen?.mode?.toJson()}');
    print('perform : ${_displayScreen?.perform?.toJson()}');
    print('perform : ${_displayScreen?.locationWifi?.toJson()}');
    print('perform : ${_displayScreen?.locationShop?.toJson()}');
    notifyListeners();
  }
}
