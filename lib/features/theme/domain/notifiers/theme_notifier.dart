import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/theme/data/theme_provider.dart';

class ThemeNotifier extends StateNotifier<ThemeProvider> {
  ThemeNotifier() : super(ThemeProvider.light);

  void toggleTheme() {
    state =
        state == ThemeProvider.light ? ThemeProvider.dark : ThemeProvider.light;
  }

  void setLightTheme() {
    state = ThemeProvider.light;
  }

  void setDarkTheme() {
    state = ThemeProvider.dark;
  }
}
