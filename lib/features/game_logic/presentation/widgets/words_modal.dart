import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';

class WordsModal extends ConsumerWidget {
  const WordsModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameLogicProvider);
    final gameLogic = ref.read(gameLogicProvider.notifier);
    final guessedWords = gameLogic.userMatches;
    final words = gameLogic.selectedWords
        .where((word) => guessedWords.contains(word.headword))
        .toList();

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        // separatorBuilder: (context, index) => const Divider(),
        itemCount: words.length,
        itemBuilder: (context, index) {
          final word = words[index];
          List<String?>? definitions =
              word.definitions?.map((def) => def.translation).toList();
          return ListTile(
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              word.headword!,
            ),
            subtitle: Text(
              definitions!.where((element) => element != null).join(', '),
            ),
            trailing: Badge(
              label: Text(
                '+${word.headword?.length}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
              ),
              backgroundColor: Colors.lightGreen,
            ),
          );
        },
      ),
    );
  }
}
