import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/game_logic/presentation/widgets/show_results_widget.dart';
import 'package:likha_varv/features/info/info_dialog_widget.dart';
import 'package:likha_varv/features/rankings/presentation/rankings_widget.dart';
import 'package:likha_varv/features/theme/presentation/theme_switch_widget.dart';
import 'package:line_icons/line_icons.dart';

class VarvAppBar extends ConsumerWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  const VarvAppBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      iconTheme: IconThemeData(
        color:
            Theme.of(context).colorScheme.onPrimary, // specify the color here
      ),
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primary,
      leadingWidth: 150,
      leading: Row(
        children: [
          const SizedBox(width: 4),
          SvgPicture.asset('assets/icons/bee.svg', height: 25, width: 25),
          const SizedBox(width: 6),
          const Text(
            'likha varv',
            style: TextStyle(fontFamily: 'Pacifico', fontSize: 18),
          ),
        ],
      ),
      actions: [
        Row(
          children: [
            IconButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) => const ShowResultsWidget(),
                );
              },
              icon: const Icon(LineIcons.alternateRedo),
            ),
            IconButton(
              icon: const Icon(LineIcons.barChartAlt),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(LineIcons.cog),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const ThemeSwitchWidget(),
                );
              },
            ),
            IconButton(
              icon: const Icon(LineIcons.infoCircle),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => const InfoDialogWidget(),
                );
              },
            ),
          ],
        )
      ],
    );
  }
}
