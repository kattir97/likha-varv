import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game/domain/providers/game_logic_provider.dart';

final scoreProvider = Provider<int>((ref) {
  final gameLogic = ref.watch(gameLogicProvider.notifier);
  return gameLogic.score;
});
