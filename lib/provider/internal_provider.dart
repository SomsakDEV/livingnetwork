import 'package:flutter/material.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class InternalProvider with ChangeNotifier {
  InitialInternal? repo;
  late bool _verify = false;

  Mode5G? _mode;

  Mode5G? get mode => _mode;
  String? _status;

  String? get status => _status;

  Future<bool> initialCore(String token) async {
    WidgetsFlutterBinding.ensureInitialized();
    var coreConfig = CoreConfig(mode: Mode.release);
    coreConfig.checkOrGetConfig().whenComplete(() => IntiAppCionfig().setInitAppConfig().whenComplete(() => coreConfig.checkCacheConfig()));
    return internalPrepare(token);
  }

  Future<bool> internalPrepare(String token) async {
    List<String?> listCase = [null, 'mobile4G', 'mobile5G'];
    String? caseTest= listCase[2];
    repo = repo ?? InitialInternal();
    _mode = await repo?.getModeSocket(token, caseTest: caseTest);
    // _mode = await repo?.getMode(token, caseTest: caseTest);
    _status = caseTest ?? await repo?.getCurrentNetworkStatus();
    print('Mode : ${_mode?.toJson()}');
    _verify = (_mode != null);
    notifyListeners();
    return _verify;
  }

  Future<String> updateMode5G(MsisdnDB? msisdnDB, CheckModeProfile? checkModeProfile) async {
    repo = repo ?? InitialInternal();
    _mode = await repo?.updateMsisdn(msisdnDB, checkModeProfile);
    print('Mode reload  : ${_mode?.toJson()}');
    notifyListeners();
    return "Success";
  }

  Future<String> getAddMode(Msisdn? msisdn,String mode) async {
    repo = repo ?? InitialInternal();
    _mode = await repo?.getAddPackageSocket(msisdn, mode);
    notifyListeners();
    return "Success";
  }

  Future<String> getDeleteMode(Msisdn? msisdn,String mode) async {
    repo = repo ?? InitialInternal();
    _mode = await repo?.getDeletePackageSocket(msisdn, mode);
    notifyListeners();
    return "Success";
  }
}
