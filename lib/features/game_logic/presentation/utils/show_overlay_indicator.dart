import 'package:flutter/material.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/correct_answer_indicator.dart';

void showOverlayIndicator(BuildContext context, int score) {
  OverlayState overlayState = Overlay.of(context);
  OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(
    builder: (context) => Positioned.fill(
      child: Container(
        color: Colors.transparent,
        child: Center(
          child: CorrectAnswerIndicator(
            score: score,
          ),
        ),
      ),
    ),
  );

  overlayState.insert(overlayEntry);

  Future.delayed(const Duration(milliseconds: 500), () {
    overlayEntry.remove();
  });
}
