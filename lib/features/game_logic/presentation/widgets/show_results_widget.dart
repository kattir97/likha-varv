import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/common_widgets/dialog_header_widget.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/light_blue_button_widget.dart';

class ShowResultsWidget extends ConsumerWidget {
  const ShowResultsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameLogic = ref.read(gameLogicProvider.notifier);
    final posMatches = gameLogic.possibleMatches;
    final userMatches = gameLogic.userMatches;
    final List<Word> wordsRaw = gameLogic.words;
    final words = wordsRaw.where((word) {
      // print('word: ${word.headword}');
      return posMatches.contains(word.headword);
    }).toList();

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DialogHeaderWidget(text: 'Results'),
          const SizedBox(height: 10),
          SizedBox(
            height: 350,
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              separatorBuilder: (context, index) => const Divider(),
              itemCount: words.length,
              itemBuilder: (context, index) {
                final word = words.elementAt(index);
                final isFound = userMatches.contains(word.headword);
                List<String?>? definitions =
                    word.definitions?.map((def) => def.translation).toList();
                final MaterialColor color = isFound ? Colors.green : Colors.red;
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        word.headword!,
                        style: TextStyle(
                          color: color,
                        ),
                      ),
                      Text(
                        definitions!
                            .where((element) => element != null)
                            .join(', '),
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LightBlueButtonWidget(
                  title: 'Restart',
                  onTap: () {
                    gameLogic.restart();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
