import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/player.dart';

class PlayerProvider extends ChangeNotifier {
  List<Player> players = [];

  void addPlayer(String name) {
    players.add(
      Player(name: name),
    );
    notifyListeners();
  }

  List<Player> get getPlayers => players;
}
