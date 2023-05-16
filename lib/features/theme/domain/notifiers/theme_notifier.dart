import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/services/shared_prefs_service.dart';
import 'package:likha_varv/features/theme/data/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeProvider> {
  ThemeNotifier() : super(ThemeProvider.light) {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    final theme = await SharedPrefsService.loadTheme();
    state = theme;
  }

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
