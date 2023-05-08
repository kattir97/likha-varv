import 'package:flutter/material.dart';

class InfoDialogWidget extends StatelessWidget {
  const InfoDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
                  'How to Play',
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: const [
                SizedBox(height: 16.0),
                Text(
                  '1. Game starts with generated random letters. '
                  'You can also manually shuffle the letters by tapping the shuffle button.\n\n'
                  '2. Find as many words as you can from the available letters by tapping '
                  'on the letter tiles in any order.\n\n'
                  '3. To score points, the word must be at least 2 letters long and must '
                  'be in the list of possible words generated from the given letters. '
                  'The longer the word, the more points you score.\n\n'
                  '4. Each word can only be used once per game. '
                  'You can view the words you have already found by tapping the '
                  '"Guessed" tab at the top of the screen.\n\n'
                  '5. The game ends when you have found all the possible words '
                  'or when you tap "Finish". Good luck!',
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
