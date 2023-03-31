// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class InternalProvider with ChangeNotifier {
  InitialInternal? repo;
  Mode5G? _mode5G;
  String? _status;
  DateTime? _sExpire;
  String? _caseTest;
  LocationWifi? _locationWifi;
  LocationShop? _locationShop;

  Mode5G? get mode5G => _mode5G;

  String? get status => _status;

  DateTime? get sExpire => _sExpire;

  LocationShop? get locationShop => _locationShop;

  LocationWifi? get locationWifi => _locationWifi;

  caseTest(String value) {
    if (value.startsWith('5G')) {
      _caseTest = 'mobile5G';
    } else if (value.startsWith('4G')) {
      _caseTest = 'mobile4G';
    }
  }

  Future<bool> initialCore(String token) async {
    try {
      caseTest(token);
      WidgetsFlutterBinding.ensureInitialized();
      var coreConfig = CoreConfig(mode: Mode.debug);
      await coreConfig.checkOrGetConfig().whenComplete(() => IntiAppCionfig().setInitAppConfig().whenComplete(() => coreConfig.checkCacheConfig()));
      return await internalPrepare(token);
    } catch (e, st) {
      print('[LIVING_NETWORK] $e, $st');
      return false;
    }
  }

  Future<bool> internalPrepare(String token) async {
    try {
      String shop = await rootBundle.loadString('assets/data/mock_ais1_shop.json');
      String wifi = await rootBundle.loadString('assets/data/mock_ais1_wifi.json');
      _locationShop = LocationShop.fromJson(json.decode(shop));
      _locationWifi = LocationWifi.fromJson(json.decode(wifi));
      repo = repo ?? InitialInternal();
      _mode5G = await repo?.initiateProcess(token, caseTest: _caseTest);
      print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
      _status = _caseTest ?? await repo?.getCurrentNetworkStatus();
      _sExpire = DateTime.parse(_mode5G?.msisdn?.expireDate as String);
      if ((_sExpire?.difference(DateTime.now()).inSeconds ?? 0) > 1) {
        notifyListeners();
        return (_mode5G != null);
      }
    } catch (e, st) {
      print('[LIVING_NETWORK] $e, $st');
    }
    return false;
  }

  Future<bool> getAddMode(String mode) async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.addPackage(mode5G, mode, (mode5G?.mode as String), caseTest: _caseTest);
    print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
    notifyListeners();
    return _mode5G?.error ?? true;
  }

  Future<bool> getDeleteMode(String mode) async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.deletePackage(mode5G, mode, (mode5G?.mode as String), caseTest: _caseTest);
    print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
    notifyListeners();
    return _mode5G?.error ?? true;
  }

  Future<bool> getExpireMode() async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.getExpirePackageSocket(mode5G, caseTest: _caseTest);
    notifyListeners();
    return _mode5G?.error ?? true;
  }

  String? _markerTab;

  String? get markerTab => _markerTab;

  void updateMarkerTab(String id) {
    _markerTab = id;
    notifyListeners();
  }
}
