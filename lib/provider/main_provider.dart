import 'package:flutter/material.dart';
import 'package:living_network_repository/data/repositories/repositories_impl.dart';
import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class MainProvider with ChangeNotifier {
  Future<DisplayScreen>? displayScreen1;
  DisplayScreen? displayScreen;

  MainProvider({
    this.displayScreen1,
    this.displayScreen,
  });

  Future<void> loadData() async {
    GetDataCatalogUseCase? usecase = GetDataCatalogUseCase(RepositoriesImpl());
    displayScreen = await usecase.getMockupData();
    print('Living koko game: ${displayScreen?.perform?.game}');
    print('Living koko live: ${displayScreen?.perform?.live}');
    notifyListeners();
  }

  Future<void> getData() async {
    final s = await displayScreen1;
    displayScreen = DisplayScreen(perform: s?.perform);
    print('Living koko : ${displayScreen?.perform?.game}');
  }
}
