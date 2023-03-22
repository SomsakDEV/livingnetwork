import 'package:flutter/material.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class InternalProvider with ChangeNotifier {
  InitialInternal? repo;
  late bool _verify = false;
  final String token = "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6IjlVeTRLUjlzOEoifQ.eyJpc3MiOiJzcmYuYWlzLmNvLnRoL2FkbWQiLCJzdWIiOiJ0b2tlbl9jbGllbnRfY3JlZGVudGlhbHMiLCJhdWQiOiJTVzhMaUdGd3dqQmJ0eDd0d2c3Z2dhZHVxL2VlZzhFM2c3dmtrVlNCVis5aVpxZkRsbERqMnc9PSIsImV4cCI6MTk4NzI3MTE2MywiaWF0IjoxNjcxNzAxNjQzLCJqdGkiOiI0RjhBaUM1S1VzT3gyeDQ3UzhlOGJKIiwiY2xpZW50IjoiT1RBd01EQXdNREF3TURBd05qWXpMRzE1WVdsemZFSmhZMnRsYm1SOE1TNHdMakE9Iiwic3NpZCI6IjNxNGlmMWVaMTF4NkdDSzRPWGQ4VUIifQ.d64EmMj1NQEE1yciOZwVrdS7gAeD6A-gQb3SOHkAuap2vgcBTi07G_WvX5Q2gVlGlttq-j05S1Qp6LNKl3vo-DqKXhc5PpmYK6pMxDiur_97OBB2ePAdcJJRpMNQUBmLOXIFPKxKN4WP6mRTVCkayqso1G_v0cILtIpPokvFHOc";
  Mode5G? _mode;

  Mode5G? get mode => _mode;

  Future<bool> internalPrepare() async {
    repo = repo ?? InitialInternal();
    _mode = await repo?.getMode(token);
    print('Mode : ${_mode?.toJson()}');
    _verify = (_mode != null);
    notifyListeners();
    return _verify;
  }


  Future<String> updateMode5G(
      MsisdnDB? msisdnDB, CheckModeProfile? checkModeProfile) async {
    repo = repo ?? InitialInternal();
    _mode = await repo?.updateMsisdn(msisdnDB, checkModeProfile);
    print('Mode reload  : ${_mode?.toJson()}');
    notifyListeners();
    return "Success";
  }
}
