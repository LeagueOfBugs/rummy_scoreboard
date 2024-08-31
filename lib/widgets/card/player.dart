import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/player.dart';
import 'package:flutter_application_1/widgets/card/game_card.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  const PlayerCard({super.key, required this.player});

  @override
  Widget build(BuildContext context) {
    return GameCard(
      gameCardChildren: Column(
        children: [
          Flexible(
            child: Text(player.name),
          ),
          Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(color: Colors.orange.shade300),
              ))
        ],
      ),
    );
  }
}
