import 'package:get_it/get_it.dart';

import '../services/rest_api/pokemon_detail_service.dart';

GetIt locator = GetIt.instance;

Future<void> setUpLocator() async {
  locator.registerLazySingleton<PokemonDetailService>(
    () => PokemonDetailService(),
  );

  await locator.allReady();
}
