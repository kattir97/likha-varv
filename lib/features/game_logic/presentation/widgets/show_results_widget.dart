import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final List<Word> wordsRaw = gameLogic.rawList;
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
          Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Text(
                  'Results',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
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
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
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
