import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pokemon_go/core/locator/locator.dart';

final startUpServiceProvider = Provider<StartUpService>((ref) {
  return StartUpService();
});

class StartUpService {
  StartUpService();

  Future<void> init() async {
    // Load the JSON config into memory
    await setUpLocator();
  }
}
