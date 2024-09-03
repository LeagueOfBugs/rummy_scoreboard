import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

class NewGame extends StatelessWidget {
  const NewGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${playerProvider.getWinner.name} wins!',
                style: const TextStyle(fontSize: 30),
              ),
              TextButton(
                onPressed: () {
                  playerProvider.newGame();
                },
                child: const Text('new game'),
              ),
            ],
          ),
        );
      },
    );
  }
}
