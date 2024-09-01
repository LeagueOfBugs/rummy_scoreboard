import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/card/leaderboard.dart';
import 'package:flutter_application_1/widgets/render_player_cards.dart';

class StartGame extends StatelessWidget {
  const StartGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Colors.red,
            child: const Column(
              children: [
                Text('hi'),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  color: Colors.blue,
                  child: const Leaderboard(),
                ),
              ),
              Expanded(
                // flex: 1,
                child: Container(
                  color: Colors.green,
                  child: const RenderPlayerCards(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
