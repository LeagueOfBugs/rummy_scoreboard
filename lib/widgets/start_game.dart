import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:flutter_application_1/widgets/card/history.dart';
import 'package:flutter_application_1/widgets/card/leaderboard.dart';
import 'package:flutter_application_1/widgets/new_game.dart';
import 'package:flutter_application_1/widgets/render_player_cards.dart';
import 'package:provider/provider.dart';

class StartGame extends StatefulWidget {
  const StartGame({super.key});

  @override
  State<StartGame> createState() => _StartGameState();
}

class _StartGameState extends State<StartGame> {
  @override
  Widget build(BuildContext context) {
    bool gameEnded = Provider.of<PlayerProvider>(context).gameEnded;

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: const Color.fromARGB(255, 255, 255, 255),
            child: const History(),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!gameEnded) ...[
                const Expanded(
                  child: Leaderboard(),
                ),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RenderPlayerCards(),
                  ),
                ),
              ],
              if (gameEnded)
                const Expanded(
                  child: NewGame(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
