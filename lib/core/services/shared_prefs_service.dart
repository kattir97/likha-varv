import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  // Shared Preferences Keys
  static const String scoreKey = 'score';
  static const String userMatchesKey = 'userMatches';
  static const String possibleMatchesKey = 'possibleMatches';
  static const String isFirstOpenKey = 'isFirstOpen';
  static const String generatedLettersKey = 'generated_letters';

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
}
