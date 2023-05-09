import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';

class CongratsMessage extends ConsumerWidget {
  final VoidCallback onRestartPressed;

  const CongratsMessage({
    Key? key,
    required this.onRestartPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final guessedWords = ref.read(gameLogicProvider.notifier).userMatches;
    final gameLogic = ref.read(gameLogicProvider.notifier);
    final posMatches = gameLogic.possibleMatches;
    final List<Word> wordsRaw = gameLogic.words;
    final words = wordsRaw.where((word) {
      // print('word: ${word.headword}');
      return posMatches.contains(word.headword);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Congratulations! 🎉'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text('You found all the possible words!',
                  style: TextStyle(fontSize: 20)),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: words.length,
                itemBuilder: (context, index) {
                  final word = words.elementAt(index);
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 6, 228, 99),
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                        '${word.headword} - ${word.definitions?.first.translation}'),
                  );
                },
              ),
            ),
            Center(
              child: ElevatedButton(
                child: const Text('Restart'),
                onPressed: () {
                  onRestartPressed();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
