import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

class Leaderboard extends StatelessWidget {
  const Leaderboard({super.key});

  @override
  Widget build(BuildContext context) {
    print('in leaderboard');
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        return Text(playerProvider.players
            .map((player) => player.name)
            .toList()
            .toString());
      },
    );
  }
}
