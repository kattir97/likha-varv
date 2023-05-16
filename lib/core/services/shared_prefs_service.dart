import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/features/theme/data/theme_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // Shared Preferences Keys
  static const String scoreKey = 'score';
  static const String userMatchesKey = 'userMatches';
  static const String possibleMatchesKey = 'possibleMatches';
  static const String isFirstOpenKey = 'isFirstOpen';
  static const String generatedLettersKey = 'generated_letters';
  static const String selectedWordsKey = 'selected_words';
  static const String themeKey = 'theme';

  static Future<int> getScore() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(scoreKey) ?? 0;
  }

  static Future<void> saveScore(int score) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(scoreKey, score);
  }

  static Future<List<String>> getUserMatches() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(userMatchesKey) ?? [];
  }

  static Future<void> saveUserMatches(List<String> userMatches) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(userMatchesKey, userMatches);
  }

  static Future<List<String>> getPossibleMatches() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(possibleMatchesKey) ?? [];
  }

  static Future<void> savePossibleMatches(List<String> possibleMatches) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(possibleMatchesKey, possibleMatches);
  }

  static Future<void> saveSelectedWords(Set<Word> selectedWords) async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = selectedWords.map((word) => word.toJson()).toList();
    final encodedString = jsonEncode(encodedData);
    await prefs.setString(selectedWordsKey, encodedString);
  }

  static Future<Set<Word>> getSelectedWords() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedString = prefs.getString(selectedWordsKey);
    if (encodedString != null) {
      final decodedData = jsonDecode(encodedString) as List<dynamic>;
      final selectedWords =
          decodedData.map((json) => Word.fromJson(json)).toSet();
      return selectedWords;
    }
    return Set<Word>();
  }

  static Future<List<String>> getGeneratedLetters() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(generatedLettersKey) ?? [];
  }

  static Future<void> saveGeneratedLetters(
      List<String> generatedLetters) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(generatedLettersKey, generatedLetters);
  }

  static Future<bool> getIsFirstOpen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstOpenKey) ?? true;
  }

  static Future<void> setIsFirstOpen(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isFirstOpenKey, value);
  }

  static Future<void> saveTheme(ThemeProvider theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(themeKey, theme.toString());
  }

  static Future<ThemeProvider> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    ThemeProvider theme;
    final themeString = prefs.getString(themeKey);
    if (themeString != null) {
      theme = ThemeProvider.values.firstWhere(
        (value) => value.toString() == themeString,
        orElse: () => ThemeProvider.light,
      );
      return theme;
    } else {
      return ThemeProvider.light;
    }
  }
}
