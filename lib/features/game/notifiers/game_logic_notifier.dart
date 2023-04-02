import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/data/letters.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/features/game/domain/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GameLogic extends StateNotifier<List<String>> {
  GameLogic() : super([]);
  // Shared Preferences
  final String scoreKey = 'score';
  final String userMatchesKey = 'userMatches';
  final String possibleMatchesKey = 'possibleMatches';
  final String isFirstOpenKey = 'isFirstOpen';
  final String generatedLettersKey = 'generated_letters';

  List<Word> rawList = [];
  List<String> words = [];
  List<String> letters = letterList;
  int score = 0;
  List<String> userMatches = [];
  List<String> possibleMatches = [];
  int get possibleScore =>
      possibleMatches.fold(0, (sum, word) => sum + word.length);

  // Shared Prefs methods
  Future<void> saveGameData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(scoreKey, score);
    await prefs.setStringList(userMatchesKey, userMatches);
    await prefs.setStringList(possibleMatchesKey, possibleMatches);
    await prefs.setStringList(generatedLettersKey, state);
  }

  Future<void> loadGameData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    score = prefs.getInt(scoreKey) ?? 0;
    userMatches = prefs.getStringList(userMatchesKey) ?? [];
    possibleMatches = prefs.getStringList(possibleMatchesKey) ?? [];
    state = prefs.getStringList(generatedLettersKey) ?? [];
    state = List.from(state);
    print(state);
  }

  Future<bool> checkFirstOpen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(isFirstOpenKey) ?? true;
  }

  Future<void> setIsFirstOpen(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isFirstOpenKey, value);
  }

  // Shared Prefes End

  void shuffle() {
    state = List.from(state)..shuffle();
  }

  void restart() {
    userMatches.clear();
    possibleMatches.clear();
    state.clear();
    score = 0;
    generateLetters();
    while (possibleMatches.isEmpty || possibleMatches.length < 5) {
      generateLetters();
    }

    saveGameData();
    state = List.from(state);
    print('FROM RESTART: $state');
    print('FROM RESTART: $possibleMatches');
  }

  String checkWord(String input, BuildContext context) {
    if (possibleMatches.contains(input)) {
      if (!userMatches.contains(input)) {
        userMatches.add(input);
        score += input.length;
        state = List.from(state);
        saveGameData();
        return Strings.correct;
      } else {
        return Strings.alreadyFound;
      }
    } else {
      return Strings.notInTheList;
    }
  }

  void generatePossibleMatches() {
    possibleMatches.clear();
    Set<String> usedWords = {};
    for (String word in words) {
      List<String> remainingLetters = List<String>.from(state);
      bool possible = true;
      for (int i = 0; i < word.length; i++) {
        String letter = word[i];
        if (remainingLetters.contains(letter)) {
          remainingLetters.remove(letter);
        } else {
          possible = false;
          break;
        }
      }
      if (possible && !usedWords.contains(word)) {
        possibleMatches.add(word);
        usedWords.add(word);
      }
    }
    print(possibleMatches);
  }

  void generateLetters() {
    print(state);
    state.clear();
    while (state.length < 7) {
      int randomIndex = Random().nextInt(letters.length);
      String letter = letters[randomIndex];
      if (!state.contains(letter)) {
        state.add(letter);
      }
    }
    generatePossibleMatches();
  }
}
