import 'package:flutter/material.dart';
import 'package:living_network_repository/data/repositories/repositories_impl.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class LnProvider with ChangeNotifier {
  DisplayScreen? _displayScreen;
  DisplayScreen? get displayScreen => _displayScreen;

  late bool _verify = false;
  bool get verify => _verify;


  Future<bool> prepareData() async {
    GetDataCatalogUseCase? repo = GetDataCatalogUseCase(RepositoriesImpl());
    _displayScreen = await repo.getMockupData();
    _verify =  (_displayScreen != null);
    // _verify = (_displayScreen != null && (_displayScreen!.mode != null && _displayScreen!.perform != null && _displayScreen!.location != null));
    print('_verify Data : $_verify');
    notifyListeners();
    return _verify;
  }

  Future<void> loadData() async {
    GetDataCatalogUseCase? repo = GetDataCatalogUseCase(RepositoriesImpl());
    _displayScreen = await repo.getMockupData();
    print('Mode : ${_displayScreen?.mode?.toJson()}');
    print('perform : ${_displayScreen?.perform?.toJson()}');
    print('location : ${_displayScreen?.location?.toList()[0].toJson()}');
    notifyListeners();
  }
}
