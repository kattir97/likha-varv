import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/models/word.dart';

import 'package:likha_varv/features/game_logic/data/constants/strings.dart';
import 'package:likha_varv/features/game_logic/presentation/utils/show_error_snack_bar.dart';
import 'package:likha_varv/features/game_logic/presentation/utils/show_overlay_indicator.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/congrats_widget.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/letters_widget.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/light_blue_button_widget.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/user_input_widget.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/varv_app_bar_widget.dart';
import 'package:likha_varv/features/info/info_dialog_widget.dart';
import 'package:likha_varv/features/scoreline/presentation/scoreline_widget.dart';
import 'package:line_icons/line_icons.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final gameLogic = ref.watch(gameLogicProvider.notifier);
    final letters = ref.watch(gameLogicProvider);

    return Scaffold(
      appBar: const VarvAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50, child: ScorelineWidget()),
            const SizedBox(height: 10),
            SizedBox(
                height: 50, child: UserInputWidget(controller: textController)),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Letters(
                    // centerLetter: gameLogic.centerLetter,
                    letters: letters,
                    controller: textController,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LightBlueButtonWidget(
                      title: 'Shuffle',
                      onTap: () {
                        gameLogic.shuffle();
                      },
                    ),
                    const SizedBox(width: 10),
                    LightBlueButtonWidget(
                      title: 'Submit',
                      onTap: () {
                        final result =
                            gameLogic.checkWord(textController.text, context);
                        if (gameLogic.score == gameLogic.possibleScore) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return CongratsMessage(
                                  onRestartPressed: gameLogic.restart);
                            },
                          );
                        } else {
                          if (result == Strings.alreadyFound) {
                            showErrorSnackbar(Strings.alreadyFound, context);
                          } else if (result == Strings.notInTheList) {
                            showErrorSnackbar(Strings.notInTheList, context);
                          } else {
                            final score = gameLogic.userMatches.last.length;
                            showOverlayIndicator(context, score);
                          }
                        }
                        textController.clear();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LightBlueButtonWidget(
                      title: 'Finish',
                      onTap: () async {
                        return _showAnswer(ref, context);
                      },
                    ),
                    const SizedBox(width: 10),
                    LightBlueButtonWidget(
                      title: 'Delete',
                      onTap: () {
                        final input = textController.text;
                        if (input.isNotEmpty) {
                          textController.text =
                              input.substring(0, input.length - 1);
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _showAnswer(ref, context) {
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