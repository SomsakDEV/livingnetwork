import 'package:flutter/material.dart';

import 'package:living_network_repository/domain/entities/display_screen.dart';
import 'package:living_network_repository/living_network_repository.dart';

class LnProvider with ChangeNotifier {
  GetDataCatalogUseCase? repo;
  DisplayScreen? displayScreen;

  LnProvider({
    required this.repo,
  });

  Future<void> loadData() async {
    displayScreen = await repo?.getMockupData();
    print('Living koko game: ${displayScreen?.perform?.game}');
    print('Living koko live: ${displayScreen?.perform?.live}');
    print('Living koko social: ${displayScreen?.perform?.social}');
    print('Living koko music: ${displayScreen?.perform?.music}');
    notifyListeners();
  }
}
