import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/common_widgets/dialog_header_widget.dart';
import 'package:likha_varv/core/services/shared_prefs_service.dart';
import 'package:likha_varv/features/theme/data/theme_provider.dart';
import 'package:likha_varv/features/theme/domain/providers/theme_provider.dart';

class ThemeSwitchWidget extends ConsumerWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    print(theme);
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DialogHeaderWidget(text: 'Settings'),
          Column(
            children: [
              InkWell(
                child: ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text('Light Theme'),
                  leading: Radio<ThemeProvider>(
                    value: ThemeProvider.light,
                    groupValue: theme,
                    onChanged: (value) {
                      ref.read(themeProvider.notifier).setLightTheme();
                    },
                  ),
                ),
                onTap: () {
                  ref.read(themeProvider.notifier).setLightTheme();
                  SharedPrefsService.saveTheme(ThemeProvider.light);

                  Navigator.of(context).pop();
                },
              ),
              InkWell(
                child: ListTile(
                  visualDensity:
                      const VisualDensity(horizontal: -4, vertical: -4),
                  contentPadding: const EdgeInsets.all(0),
                  title: const Text(
                    'Dark Theme',
                    textAlign: TextAlign.start,
                  ),
                  leading: Radio<ThemeProvider>(
                    value: ThemeProvider.dark,
                    groupValue: theme,
                    onChanged: (value) {
                      ref.read(themeProvider.notifier).setDarkTheme();
                    },
                  ),
                ),
                onTap: () {
                  ref.read(themeProvider.notifier).setDarkTheme();
                  SharedPrefsService.saveTheme(ThemeProvider.dark);
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
