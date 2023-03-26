// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class InternalProvider with ChangeNotifier {
  InitialInternal? repo;
  Mode5G? _mode5G;
  String? _status;
  DateTime? _sExpire;

  Mode5G? get mode5G => _mode5G;

  String? get status => _status;

  DateTime? get sExpire => _sExpire;

  List<String?> listCase = [null, 'mobile4G', 'mobile5G'];
  String? caseTest;

  Future<bool> initialCore(String token) async {
    try {
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
      caseTest = listCase[2];
      repo = repo ?? InitialInternal();
      _mode5G = await repo?.getModeSocket(token, caseTest: caseTest);
      _status = caseTest ?? await repo?.getCurrentNetworkStatus();
      _sExpire = DateTime.parse(_mode5G?.msisdn?.expireDate as String);
      print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
      notifyListeners();
      return (_mode5G != null);
    } catch (e, st) {
      print('[LIVING_NETWORK] $e, $st');
      return false;
    }
  }

  Future<String> updateMode5G(MsisdnMode? msisdnDB, CheckModeProfile? checkModeProfile) async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.updateMsisdn(msisdnDB, checkModeProfile);
    print('[LIVING_NETWORK] Mode reload  : ${_mode5G?.toJson()}');
    notifyListeners();
    return "Success";
  }

  Future<String> getAddMode(String mode) async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.getAddPackageSocket(mode5G, mode, (mode5G?.mode as String), caseTest: caseTest);
    notifyListeners();
    return "Success";
  }

  Future<String> getDeleteMode(String mode) async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.getDeletePackageSocket(mode5G, mode, (mode5G?.mode as String), caseTest: caseTest);
    notifyListeners();
    return "Success";
  }

  Future<String> getExpireMode() async {
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.getExpirePackageSocket(mode5G, caseTest: caseTest);
    notifyListeners();
    return "Success";
  }
}
