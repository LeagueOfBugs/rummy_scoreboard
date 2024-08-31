import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/player.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        List<Player> players = playerProvider.players;
        if (players.isEmpty) {
          return const Text('No players yet');
        }
        print('in leaderboard');
        return Column(children: [
          ...players.map((player) {
            return Text(
              player.name,
              style: const TextStyle(fontSize: 18),
            );
          }),
        ]);
      },
    );
  }
}
