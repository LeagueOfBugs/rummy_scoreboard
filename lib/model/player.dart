class Player {
  final String name;
  int score;

  Player({required this.name, this.score = 0});

  void updateScore(int newScore) {
    score += newScore;
  }
}
