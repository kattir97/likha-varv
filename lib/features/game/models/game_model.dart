class GameModel {
  final List<String> rawList;
  final List<String> words;
  final int score;
  final List<String> letters;
  final List<String> userMatches;
  final List<String> possibleMatches;

  GameModel({
    required this.rawList,
    required this.words,
    required this.score,
    required this.letters,
    required this.userMatches,
    required this.possibleMatches,
  });

  int get possibleScore =>
      possibleMatches.fold(0, (sum, word) => sum + word.length);
}
