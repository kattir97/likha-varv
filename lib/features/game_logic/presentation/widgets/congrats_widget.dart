import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/light_blue_button_widget.dart';

class CongratsWidget extends ConsumerStatefulWidget {
  final VoidCallback onRestartPressed;
  const CongratsWidget({Key? key, required this.onRestartPressed})
      : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CongratsState();
}

class _CongratsState extends ConsumerState<CongratsWidget> {
  ConfettiController confettiController = ConfettiController();

  @override
  void initState() {
    super.initState();
    confettiController =
        ConfettiController(duration: const Duration(seconds: 5));
    confettiController.play();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final gameLogic = ref.read(gameLogicProvider.notifier);
    final posMatches = gameLogic.possibleMatches;
    final List<Word> wordsRaw = gameLogic.words;
    final words = wordsRaw.where((word) {
      return posMatches.contains(word.headword);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Congratulations! 🎉'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: Text('You found all the possible words!',
                      style: TextStyle(fontSize: 20)),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: words.length,
                    itemBuilder: (context, index) {
                      final word = words.elementAt(index);
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${index + 1}.',
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${word.headword} - ${word.definitions?.first.translation}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              const Spacer(),
                              Badge(
                                label: Text(
                                  '+${word.headword?.length}',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                                backgroundColor: Colors.lightGreen,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                LightBlueButtonWidget(
                  title: 'Restart',
                  onTap: () {
                    widget.onRestartPressed();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
          ConfettiWidget(
            confettiController: confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            blastDirection: 180,
            emissionFrequency: 0.3,
          ),
        ],
      ),
    );
  }
}
