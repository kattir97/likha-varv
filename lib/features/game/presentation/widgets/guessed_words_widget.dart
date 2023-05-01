import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/features/game/domain/providers/game_logic_provider.dart';

class GuessedWordsWidget extends HookConsumerWidget {
  const GuessedWordsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameLogic = ref.watch(gameLogicProvider.notifier);
    final guessedWords = gameLogic.userMatches;
    final List<Word> words = gameLogic.rawList
        .where((word) => guessedWords.contains(word.headword))
        .toList();

    return ListView.builder(
      itemCount: guessedWords.length,
      itemBuilder: (context, index) {
        final word = words[index];
        final definition = word.definitions;
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 4,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text(word.headword!),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(definition!.first.translation!),
                // Text('Dialect: ${word.dialect}'),
              ],
            ),
          ),
        );
      },
    );
  }
}
