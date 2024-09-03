import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/player.dart';

class PlayerScoreUpdate {
  final String name;
  final int score;

  PlayerScoreUpdate({required this.name, required this.score});
}

class PlayerProvider extends ChangeNotifier {
  List<Player> players = [];

  int game = 0;
  int get getGame => game;
  int scoreThreshold = 1000;
  bool gameEnded = true;
  late Player winner =
      Player(name: "No Winner", score: 0); // Example default Player

  Player get getWinner => winner;
  List<Player> get getPlayers => players;
  List<PlayerScoreUpdate> log = [];

  void startGame() {
    addGame();
    gameEnded = false;
    notifyListeners();
  }

  void addGame() {
    game++;
  }

  void addPlayer(String name) {
    players.add(
      Player(name: name),
    );
    notifyListeners();
  }

  void addPlayers(List<String> names) {
    for (var name in names) {
      addPlayer(name);
    }
    notifyListeners();
  }

  void clearPlayers() {
    players.clear();
    notifyListeners();
  }

  void updateScore(String name, int newScore) {
    for (var player in players) {
      if (player.name == name) {
        player.updateScore(newScore);
        checkWinner();
      }
    }

    log.add(PlayerScoreUpdate(name: name, score: newScore));
    notifyListeners();
  }

  void checkWinner() {
    for (var player in players) {
      if (player.score >= scoreThreshold) {
        player.wins++;
        winner = player;
        gameEnded = true;
      }
    }

    notifyListeners();
  }

  void reset() {
    for (var player in players) {
      player.score = 0;
    }
    notifyListeners();
  }

  void newGame() {
    addGame();
    gameEnded = false;
    for (var player in players) {
      player.updateOverallScore();
    }
    reset();
    notifyListeners();
  }
}
