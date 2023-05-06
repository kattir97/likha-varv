import 'package:flutter/material.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/light_blue_button_widget.dart';

Future<void> showAnswer(ref, context) {
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      final gameLogic = ref.read(gameLogicProvider.notifier);
      final posMatches = gameLogic.possibleMatches;
      final userMatches = gameLogic.userMatches;
      final List<Word> wordsRaw = gameLogic.rawList;
      final words = wordsRaw.where((word) {
        // print('word: ${word.headword}');
        return posMatches.contains(word.headword);
      }).toList();

      return AlertDialog(
        title: const Text('Results:'),
        content: SizedBox(
          height: 200,
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: words.length,
                  itemBuilder: (context, index) {
                    final word = words.elementAt(index);
                    final isFound = userMatches.contains(word.headword);
                    final MaterialColor color =
                        isFound ? Colors.green : Colors.red;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: Text(
                        '${index + 1}. ${word.headword} - ${word.definitions?.first.translation}',
                        style: TextStyle(color: color),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: LightBlueButtonWidget(
                  title: 'Restart',
                  onTap: () {
                    gameLogic.restart();
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          )
        ],
      );
    },
  );
}
