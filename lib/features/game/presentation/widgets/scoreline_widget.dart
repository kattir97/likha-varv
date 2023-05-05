import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game/domain/providers/game_logic_provider.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ScorelineService {
  ScorelineService();

  Map<String, int> minimumScores = {};

  List<String> ranks = [
    'Beginner',
    'Novice',
    'Okay',
    'Good',
    'Solid',
    'Nice',
    'Great',
    'Amazing',
    'Genius'
  ];

  void calculateMinimumScores(int possibleScore) {
    minimumScores[ranks[0]] = 0;

    for (int i = 1; i < ranks.length; i++) {
      double prevPercentage = (i - 1) / ranks.length;
      double maxPercentage = i / ranks.length;
      int prevMinScore = minimumScores[ranks[i - 1]] ?? 0;
      int minScore =
          (prevMinScore + ((maxPercentage - prevPercentage) * possibleScore))
              .ceil();
      minimumScores[ranks[i]] = minScore;
    }
  }

  String getCurrentRank(int score) {
    String currentRank = ranks[0];
    for (int i = 0; i < ranks.length; i++) {
      if (score < minimumScores[ranks[i]]!) {
        break;
      }
      currentRank = ranks[i];
    }
    return currentRank;
  }

  int getCurrentRankIndex(int score) {
    int currentRankIndex = 0;
    for (int i = 0; i < ranks.length; i++) {
      if (score < minimumScores[ranks[i]]!) {
        break;
      }
      currentRankIndex = i;
    }
    return currentRankIndex;
  }

  int calculatePointsToNextRank(int score) {
    int currentRankIndex = getCurrentRankIndex(score);
    if (currentRankIndex == ranks.length - 1) {
      return 0; // no next rank, return 0
    }
    int minimumScoreForNextRank = minimumScores[ranks[currentRankIndex + 1]]!;
    return minimumScoreForNextRank - score;
  }

  String getNextRank(String currentRank) {
    int currentRankIndex = ranks.indexOf(currentRank);
    if (currentRankIndex == -1 || currentRankIndex == ranks.length - 1) {
      return 'Max Rank'; // no next rank, return "Max Rank"
    }
    return ranks[currentRankIndex + 1];
  }
}

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

    return Padding(
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
            child: Row(
              children: [
                CustomSlider(
                    possibleScore: possibleScore,
                    score: score,
                    service: service),
              ],
            ),
          ),
          const Icon(
            LineIcons.crown,
            color: Colors.amber,
          )
        ],
      ),
    );
  }
}

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    Key? key,
    required this.possibleScore,
    required this.score,
    required this.service,
  }) : super(key: key);

  final int possibleScore;
  final int score;
  final ScorelineService service;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SfSliderTheme(
        data: SfSliderThemeData(
          thumbRadius: 13,
          thumbColor: Colors.amber,
          inactiveDividerColor: Colors.grey,
          activeDividerColor: Colors.amber,
          activeTrackColor: Colors.amber,
          inactiveTrackColor: Colors.lightBlue,
          inactiveDividerRadius: 6.0,
          activeDividerRadius: 6.0,
          overlayColor: Colors.transparent,
        ),
        child: SfSlider(
          min: 0,
          max: possibleScore,
          value: score,
          interval: (possibleScore / 8),
          showLabels: false,
          showTicks: false,
          showDividers: false,
          thumbIcon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                score.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
          onChanged: (dynamic value) {},
        ),
      ),
    );
  }
}
