import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';

class WordsOverview extends ConsumerWidget {
  const WordsOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameLogicProvider);
    final gameLogic = ref.read(gameLogicProvider.notifier);
    final guessedWords = gameLogic.userMatches;
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Text(
        guessedWords.join(' '),
        style: TextStyle(
          fontSize: 18,
          overflow: TextOverflow.ellipsis,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }
}
