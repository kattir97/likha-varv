import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game/domain/providers/game_logic_provider.dart';

class ScoreSliderWidget extends HookConsumerWidget {
  const ScoreSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameLogicProvider);
    final gameLogic = ref.read(gameLogicProvider.notifier);
    final score = gameLogic.score;
    final possibleScore = gameLogic.possibleScore;
    double sliderValue;

    if (score == 0 || possibleScore == 0) {
      sliderValue = 0;
    } else {
      sliderValue = score.toDouble() / possibleScore.toDouble();
    }

    String sliderTitle;
    if (sliderValue < 0.2) {
      sliderTitle = "Novice";
    } else if (sliderValue < 0.4) {
      sliderTitle = "Intermediate";
    } else if (sliderValue < 0.6) {
      sliderTitle = "Advanced";
    } else if (sliderValue < 0.8) {
      sliderTitle = "Expert";
    } else {
      sliderTitle = "Master";
    }

    return SizedBox(
      height: 50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Score: $score",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  " Possible score: $possibleScore",
                  style: const TextStyle(fontSize: 16),
                ),
                Text(
                  sliderTitle,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: sliderValue,
              backgroundColor: Colors.grey[300],
              valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
