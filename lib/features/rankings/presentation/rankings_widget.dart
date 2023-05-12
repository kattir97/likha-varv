import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/common_widgets/dialog_header_widget.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';
import 'package:likha_varv/features/rankings/domain/scoreline_service.dart';

class RankingsWidget extends ConsumerWidget {
  const RankingsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameLogic = ref.read(gameLogicProvider.notifier);
    final service = ScorelineService();
    service.calculateMinimumScores(gameLogic.possibleScore);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DialogHeaderWidget(text: 'Rankings'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                    'Rank are based on a percentage of possible points in a puzzle. The minimum scores to reach each rank for this round are: '),
                const SizedBox(height: 5),
                ListView.builder(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: service.minimumScores.length,
                  itemBuilder: (context, index) {
                    final keys = service.minimumScores.keys.toList();
                    final values = service.minimumScores.values.toList();
                    final key = keys[index];
                    final value = values[index];

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        children: [
                          const Text(
                            '\u2022', // Unicode character for black bullet
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.0,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            key,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            '($value)',
                            style: const TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
