import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/player.dart';

class PlayerProvider extends ChangeNotifier {
  List<Player> players = [
    Player(name: 'Player 1'),
    Player(name: 'Player 2'),
    Player(name: 'Player 3'),
    Player(name: 'Player 4'),
  ];

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
      }
    }
    notifyListeners();
  }

  List<Player> get getPlayers => players;
}
