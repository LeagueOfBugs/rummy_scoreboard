import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/player.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    print('in leaderboard');
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        List<Player> players = playerProvider.getPlayers;
        players.sort((a, b) => b.score.compareTo(a.score));
        return SizedBox(
          width: 500,
          child: ListView.builder(
            itemCount: players.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(players[index].name),
                trailing: Text(
                  players[index].score.toString(),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
