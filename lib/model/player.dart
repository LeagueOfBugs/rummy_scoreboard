class Player {
  final String name;
  int overallScore = 0;
  int score;
  int wins = 0;

  Player({required this.name, this.score = 0});

  void updateScore(int newScore) {
    score += newScore;
  }

  void updateOverallScore() {
    overallScore += score;
  }
}
