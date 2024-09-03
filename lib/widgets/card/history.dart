import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Text(
                'History',
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: playerProvider.log.length,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Row(
                        children: [
                          Text(
                            playerProvider.log[index].name.toString(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            playerProvider.log[index].score.toString(),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Text(
                'Overall Score',
                style: TextStyle(fontSize: 20),
              ),
              ...playerProvider.getPlayers.map((player) => Row(
                    children: [
                      Text(player.name),
                      SizedBox(width: 30),
                      Text(player.overallScore.toString()),
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }
}
