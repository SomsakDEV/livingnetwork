// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class InternalProvider with ChangeNotifier {
  InitialInternal? repo;
  String? _token;
  Mode5G? _mode5G;
  String _status = 'Passed';
  String? _detect;
  DateTime? _sExpire;
  String? _caseTest;
  LocationWifi? _locationWifi;
  LocationShop? _locationShop;

  setStatus(String value) {
    _status = value;
    notifyListeners();
  }

  String get status => _status;

  Mode5G? get mode5G => _mode5G;

  String? get detect => _detect;

  DateTime? get sExpire => _sExpire;

  LocationShop? get locationShop => _locationShop;

  LocationWifi? get locationWifi => _locationWifi;

  caseTest(String value) {
    if (value.startsWith('5G')) {
      _caseTest = 'mobile5G';
    } else if (value.startsWith('4G')) {
      _caseTest = 'mobile4G';
    } else if (value.startsWith('eyJhbGciOiJIUzI1NiJ9.eyJtb2JpbGVObyI6IjA5MzcwNjAwND')) {
      _caseTest = 'mobile5G';
    }
  }

  Future<String> initialCore(String token) async {
    try {
      caseTest(_token = token);
      WidgetsFlutterBinding.ensureInitialized();
      var coreConfig = CoreConfig(mode: Mode.debug);
      await coreConfig.checkOrGetConfig().whenComplete(() => IntiAppCionfig().setInitAppConfig().whenComplete(() => coreConfig.checkCacheConfig()));
      return await internalPrepare(token);
    } catch (e, st) {
      print('[LIVING_NETWORK] $e, $st');
      return 'Failed';
    }
  }

  Future<String> internalPrepare(String token) async {
    try {
      String shop = await rootBundle.loadString('assets/data/mock_ais1_shop.json');
      String wifi = await rootBundle.loadString('assets/data/mock_ais1_wifi.json');
      _locationShop = LocationShop.fromJson(json.decode(shop));
      _locationWifi = LocationWifi.fromJson(json.decode(wifi));
      repo = repo ?? InitialInternal();
      _detect = _caseTest ?? await repo?.getCurrentNetworkStatus();
      _mode5G = token.startsWith('5Gtest') ? await repo?.initiateProcessMock(token, caseTest: _caseTest) : await repo?.initiateProcess(token, caseTest: _caseTest);
      print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
      String code = mode5G?.errorCode ?? '';
      if (!(code == '1' || code == '2' || code == '3')) {
        if ((_mode5G?.error ?? true) || (_mode5G?.errorCode == '50000')) {
          _status = 'Failed';
        } else {
          _sExpire = DateTime.parse(_mode5G?.msisdn?.expireDate as String);
          if ((_sExpire?.difference(DateTime.now()).inSeconds ?? 0) < 1) {
            _status = 'Expire';
          }
        }
      }
      notifyListeners();
      return status;
    } catch (e, st) {
      print('[LIVING_NETWORK]$e, $st');
      _status = 'Failed';
      notifyListeners();
      return _status;
    }
  }

  Future<void> _reInitial(String token) async {
    try {
      repo = repo ?? InitialInternal();
      _mode5G = token.startsWith('5Gtest') ? await repo?.initiateProcessMock(token, caseTest: _caseTest) : await repo?.initiateProcess(token, caseTest: _caseTest);
      print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
      String code = mode5G?.errorCode ?? '';
      if (!(code == '1' || code == '2' || code == '3')) {
        if ((_mode5G?.error ?? true) || (_mode5G?.errorCode == '50000')) {
          _status = 'Failed';
        } else {
          _sExpire = DateTime.parse(_mode5G?.msisdn?.expireDate as String);
          if ((_sExpire?.difference(DateTime.now()).inSeconds ?? 0) < 1) {
            _status = 'Expire';
          }
        }
      }
    } catch (e, st) {
      print('[LIVING_NETWORK] $e, $st');
    }
  }

  Future<bool> getAddMode(String mode) async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.addPackage(mode5G, mode, (mode5G?.mode as String), caseTest: _caseTest);
    print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
    String code = mode5G?.errorCode ?? '';
    if (code == '99999') {
      await _reInitial(_token!);
      if(_status == 'Passed') {
        _mode5G?.error = mode != _mode5G?.mode;
        if (_mode5G?.error ?? false) {
          _mode5G?.errorCode = '9';
        }
      }
    } else if (code == '50000') {
      _status = 'Failed';
    }
    notifyListeners();
    return _mode5G?.error ?? true;
  }

  Future<bool> getDeleteMode(String mode) async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.deletePackage(mode5G, mode, (mode5G?.mode as String), caseTest: _caseTest);
    print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
    String code = mode5G?.errorCode ?? '';
    if (code == '99999') {
      await _reInitial(_token!);
    } else if (code == '50000') {
      _status = 'Failed';
    }
    notifyListeners();
    return _mode5G?.error ?? true;
  }

  Future<bool> getExpireMode() async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.getExpirePackageSocket(mode5G, caseTest: _caseTest);
    print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
    String code = mode5G?.errorCode ?? '';
    if (code == '99999') {
      await _reInitial(_token!);
    } else if (code == '50000') {
      _status = 'Failed';
    }
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
