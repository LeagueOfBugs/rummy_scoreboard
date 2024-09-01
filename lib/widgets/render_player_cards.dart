import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

import 'card/player_card.dart';

class RenderPlayerCards extends StatelessWidget {
  const RenderPlayerCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        return Row(
          children: [
            ...playerProvider.players.map(
              (player) {
                return PlayerCard(player: player);
              },
            ),
          ],
        );
      },
    );
  }
}
