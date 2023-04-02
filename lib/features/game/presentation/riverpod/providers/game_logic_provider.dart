import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game/notifiers/game_logic_notifier.dart';

final gameLogicProvider =
    StateNotifierProvider<GameLogic, List<String>>((ref) => GameLogic());
