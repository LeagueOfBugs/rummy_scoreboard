import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        // Filter out players with scores greater than 0
        final updatedPlayers =
            playerProvider.players.where((player) => player.score > 0).toList();

        if (updatedPlayers.isEmpty) {
          return const Text('No scores yet');
        }

        return Column(
          children: updatedPlayers.map((player) {
            return Text('${player.name} : ${player.score}');
          }).toList(),
        );
      },
    );
  }
}
