import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';
import 'package:likha_varv/features/rankings/domain/scoreline_service.dart';
import 'package:likha_varv/features/rankings/presentation/custom_slider_widget.dart';
import 'package:likha_varv/features/rankings/presentation/rankings_widget.dart';
import 'package:line_icons/line_icons.dart';

class ScorelineWidget extends ConsumerWidget {
  const ScorelineWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final service = ScorelineService();

    ref.watch(gameLogicProvider);

    final gameLogic = ref.read(gameLogicProvider.notifier);
    final score = gameLogic.score;
    final possibleScore = gameLogic.possibleScore;
    service.calculateMinimumScores(possibleScore);
    print(service.minimumScores);

    final currentRank = service.getCurrentRank(score);
    final pointsToNextRank = service.calculatePointsToNextRank(score);
    final nextRank = service.getNextRank(currentRank);

    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (context) => const RankingsWidget(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  currentRank,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: 'Lato',
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '$pointsToNextRank',
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' to $nextRank',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: IgnorePointer(
                child: CustomSliderWidget(
                    possibleScore: possibleScore,
                    score: score,
                    service: service),
              ),
            ),
            const Icon(
              LineIcons.crown,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
