// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class InternalProvider with ChangeNotifier {
  InitialInternal? repo;
  late bool _verify = false;

  Mode5G? _mode5G;

  Mode5G? get mode5G => _mode5G;
  String? _status;

  String? get status => _status;

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
    repo = repo ?? InitialInternal();
    _mode5G = await repo?.getModeSocket(token, caseTest: caseTest);
    // _mode = await repo?.getMode(token, caseTest: caseTest);
    caseTest = listCase[2];
    _status = caseTest ?? await repo?.getCurrentNetworkStatus();
    print('[LIVING_NETWORK] Mode : ${_mode5G?.toJson()}');
    _verify = (_mode5G != null);
    notifyListeners();
    return _verify;
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
}
