import 'dart:math';

import 'package:flutter/material.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/letter_widget.dart';

class Letters extends StatelessWidget {
  final List<String> letters;
  final TextEditingController controller;

  const Letters({
    Key? key,
    required this.letters,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double radius = 80.0;

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          for (int i = 0; i < letters.length - 1; i++)
            Transform.translate(
              offset:
                  Offset(radius * cos(i * pi / 3), radius * sin(i * pi / 3)),
              child: GestureDetector(
                onTap: () {
                  // Do something when the outer letter is tapped
                  controller.text += letters[i];
                },
                child: LetterWidget(letter: letters[i]),
              ),
            ),
          GestureDetector(
            onTap: () {
              // Do something when the center letter is tapped
              controller.text += letters.last;
            },
            child: LetterWidget(
              letter: letters.last,
              bgColor: Colors.amber,
            ),
          ),
        ],
      ),
    );
  }
}
