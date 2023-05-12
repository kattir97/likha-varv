import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final myScrollController = ScrollController();
    return GestureDetector(
      child: ListTile(
        leading: const Icon(LineIcons.alternateListAlt),
        title: Text(
          guessedWords.join(', '),
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      onTap: () => showModalBottomSheet(
        isDismissible: true,
        enableDrag: true,
        context: context,
        clipBehavior: Clip.hardEdge,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
        builder: (context) {
          return const WordsModal();
        },
      ),
    );
  }
}
