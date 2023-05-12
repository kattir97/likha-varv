import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/features/theme/data/theme_provider.dart';
import 'package:likha_varv/features/theme/domain/notifiers/theme_notifier.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.amber.shade400, // Customize the primary color
  // Add more customizations for other color properties
  // ...
);

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeProvider>(
    (ref) => ThemeNotifier());
