import 'package:flutter/material.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/words_modal.dart';
import 'package:line_icons/line_icons.dart';

class GuessedWordsModalWidget extends StatelessWidget {
  const GuessedWordsModalWidget({
    super.key,
    required this.guessedWords,
  });

  final List<String> guessedWords;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        leading: const Icon(LineIcons.alternateListAlt),
        title: Text(
          guessedWords.join(', '),
          overflow: TextOverflow.ellipsis,
        ),
      ),
      onTap: () => showModalBottomSheet(
        context: context,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (BuildContext context) {
          return const WordsModal();
        },
      ),
    );
  }
}
