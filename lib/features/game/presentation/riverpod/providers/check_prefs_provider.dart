import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game/presentation/riverpod/providers/game_logic_provider.dart';

final isFirstOpenProvider = FutureProvider<bool>((ref) async {
  final gameLogic = ref.read(gameLogicProvider.notifier);
  final isFirstOpen = await gameLogic.checkFirstOpen();
  if (isFirstOpen) {
    gameLogic.restart();
    await gameLogic.setIsFirstOpen(false);
  } else {
    await gameLogic.loadGameData();
  }
  return isFirstOpen;
});
