import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game_logic/domain/notifiers/game_logic_notifier.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/words_modal.dart';
import 'package:line_icons/line_icons.dart';

class GuessedWordsOverviewWidget extends ConsumerWidget {
  const GuessedWordsOverviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(gameLogicProvider);
    final guessedWords = ref.read(gameLogicProvider.notifier).userMatches;
    return InkWell(
      child: ListTile(
        leading: const Icon(LineIcons.alternateListAlt),
        title: Text(
          guessedWords.join(', '),
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black87),
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