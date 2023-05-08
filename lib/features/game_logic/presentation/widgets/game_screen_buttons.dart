import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game_logic/data/constants/strings.dart';
import 'package:likha_varv/features/game_logic/domain/notifiers/game_logic_notifier.dart';
import 'package:likha_varv/features/game_logic/presentation/utils/show_error_snack_bar.dart';
import 'package:likha_varv/features/game_logic/presentation/utils/show_overlay_indicator.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/congrats_widget.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/light_blue_button_widget.dart';
import 'package:line_icons/line_icons.dart';

class GameScreenButtons extends StatelessWidget {
  const GameScreenButtons({
    super.key,
    required this.gameLogic,
    required this.textController,
    required this.ref,
  });

  final GameLogic gameLogic;
  final TextEditingController textController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LightBlueButtonWidget(
              title: 'Delete',
              onTap: () {
                final input = textController.text;
                if (input.isNotEmpty) {
                  textController.text = input.substring(0, input.length - 1);
                }
              },
            ),
            const SizedBox(width: 10),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: const Icon(LineIcons.random),
                onPressed: () {
                  gameLogic.shuffle();
                },
              ),
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
      ],
    );
  }
}
