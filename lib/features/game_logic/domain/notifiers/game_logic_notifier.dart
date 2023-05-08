import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/data/letters.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/core/services/shared_prefs_service.dart';
import 'package:likha_varv/features/game_logic/data/constants/strings.dart';

class GameLogic extends StateNotifier<List<String>> {
  GameLogic() : super([]);

  List<Word> words = [];
  List<String> letters = letterList;
  int score = 0;
  List<String> userMatches = [];
  List<String> possibleMatches = [];
  int get possibleScore =>
      possibleMatches.fold(0, (sum, word) => sum + word.length);

  // Shared Prefs methods
  Future<void> saveGameData() async {
    await SharedPrefsService.saveScore(score);
    await SharedPrefsService.saveUserMatches(userMatches);
    await SharedPrefsService.savePossibleMatches(possibleMatches);
    await SharedPrefsService.saveGeneratedLetters(state);
  }

  Future<void> loadGameData() async {
    score = await SharedPrefsService.getScore();
    userMatches = await SharedPrefsService.getUserMatches();
    possibleMatches = await SharedPrefsService.getPossibleMatches();
    state = await SharedPrefsService.getGeneratedLetters();
    state = List.from(state);
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
    while (possibleMatches.isEmpty || possibleMatches.length < 8) {
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
    Set<String> possibleMatchesSet = {};
    for (var word in words.map((w) => w.headword!)) {
      var possible = true;
      for (int i = 0; i < word.length; i++) {
        String letter = word[i];
        if (!state.contains(letter)) {
          possible = false;
          break;
        }
      }
      if (possible) {
        possibleMatchesSet.add(word);
      }
    }
    possibleMatches = possibleMatchesSet.toList();
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
