import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/services/shared_prefs_service.dart';
import 'package:likha_varv/features/game/domain/providers/game_logic_provider.dart';

final isFirstOpenProvider = FutureProvider<bool>((ref) async {
  final gameLogic = ref.read(gameLogicProvider.notifier);
  final isFirstOpen = await SharedPrefsService.getIsFirstOpen();
  if (isFirstOpen) {
    gameLogic.restart();
    await SharedPrefsService.setIsFirstOpen(false);
  } else {
    await gameLogic.loadGameData();
  }
  return isFirstOpen;
});
