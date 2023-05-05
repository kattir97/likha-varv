class ScorelineService {
  ScorelineService();

  Map<String, int> minimumScores = {};

  List<String> ranks = [
    'Beginner',
    'Novice',
    'Okay',
    'Good',
    'Solid',
    'Nice',
    'Great',
    'Amazing',
    'Genius'
  ];

  void calculateMinimumScores(int possibleScore) {
    minimumScores[ranks[0]] = 0;

    for (int i = 1; i < ranks.length; i++) {
      double prevPercentage = (i - 1) / ranks.length;
      double maxPercentage = i / ranks.length;
      int prevMinScore = minimumScores[ranks[i - 1]] ?? 0;
      int minScore =
          (prevMinScore + ((maxPercentage - prevPercentage) * possibleScore))
              .ceil();
      minimumScores[ranks[i]] = minScore;
    }
  }

  String getCurrentRank(int score) {
    String currentRank = ranks[0];
    for (int i = 0; i < ranks.length; i++) {
      if (score < minimumScores[ranks[i]]!) {
        break;
      }
      currentRank = ranks[i];
    }
    return currentRank;
  }

  int getCurrentRankIndex(int score) {
    int currentRankIndex = 0;
    for (int i = 0; i < ranks.length; i++) {
      if (score < minimumScores[ranks[i]]!) {
        break;
      }
      currentRankIndex = i;
    }
    return currentRankIndex;
  }

  int calculatePointsToNextRank(int score) {
    int currentRankIndex = getCurrentRankIndex(score);
    if (currentRankIndex == ranks.length - 1) {
      return 0; // no next rank, return 0
    }
    int minimumScoreForNextRank = minimumScores[ranks[currentRankIndex + 1]]!;
    return minimumScoreForNextRank - score;
  }

  String getNextRank(String currentRank) {
    int currentRankIndex = ranks.indexOf(currentRank);
    if (currentRankIndex == -1 || currentRankIndex == ranks.length - 1) {
      return 'Max Rank'; // no next rank, return "Max Rank"
    }
    return ranks[currentRankIndex + 1];
  }
}
