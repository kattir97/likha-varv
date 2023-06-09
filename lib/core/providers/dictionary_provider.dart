import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:likha_varv/core/models/word.dart';
import 'package:likha_varv/features/game_logic/domain/providers/game_logic_provider.dart';

final dictionaryProvider = FutureProvider<List<Word>>((ref) async {
  // load jsons
  final String jsonStr = await rootBundle.loadString('assets/aghul.json');

  // convert to list
  final List<Map<String, dynamic>> jsonList =
      (json.decode(jsonStr) as List<dynamic>).cast<Map<String, dynamic>>();

  final List<Word> wordList = jsonList.map((e) => Word.fromJson(e)).toList();

  ref.read(gameLogicProvider.notifier).words = wordList.map((e) => e).toList();
  return wordList;
});
