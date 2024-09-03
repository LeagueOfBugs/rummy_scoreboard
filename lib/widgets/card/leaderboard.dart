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
        List<Player> players = List.from(playerProvider.getPlayers);
        players.sort((a, b) => b.score.compareTo(a.score));
        return Padding(
          padding: const EdgeInsets.only(
            left: 100,
            right: 100,
          ),
          child: SizedBox(
            child: Table(
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
              },
              children: [
                // Header row
                const TableRow(
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 255, 255, 255)),
                  children: [
                    Text(
                      'Player Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      'Score',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                    Text(
                      'Wins',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
                // Player rows
                ...players.map((player) {
                  return TableRow(
                    children: [
                      Text(
                        player.name,
                        style: const TextStyle(fontSize: 25),
                      ),
                      Text(player.score.toString(),
                          style: const TextStyle(fontSize: 25)),
                      Text(player.wins.toString(),
                          style: const TextStyle(fontSize: 25)),
                    ],
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}
