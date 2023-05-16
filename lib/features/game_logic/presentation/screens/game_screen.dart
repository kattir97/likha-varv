import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:likha_varv/features/game_logic/presentation/widgets/game_screen_buttons.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/guessed_words_overview_widget.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/letters_widget.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/user_input_widget.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/varv_app_bar_widget.dart';
import 'package:likha_varv/features/rankings/presentation/scoreline_widget.dart';

class GameScreen extends ConsumerStatefulWidget {
  const GameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameScreenState();
}

class _GameScreenState extends ConsumerState<GameScreen> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(microseconds: 500),
      () => FlutterNativeSplash.remove(),
    );
    final gameLogic = ref.watch(gameLogicProvider.notifier);
    final letters = ref.watch(gameLogicProvider);

    return Scaffold(
      appBar: const VarvAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 50, child: ScorelineWidget()),
                const GuessedWordsOverviewWidget(),
                SizedBox(
                  height: 50,
                  child: UserInputWidget(
                    controller: textController,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 250,
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
                GameScreenButtons(
                  gameLogic: gameLogic,
                  textController: textController,
                  ref: ref,
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
