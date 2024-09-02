import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerProvider>(
      builder: (context, playerProvider, child) {
        return ListView.builder(
          itemCount: playerProvider.log.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                Text(playerProvider.log[index].name.toString()),
                SizedBox(
                  width: 20,
                ),
                Text(playerProvider.log[index].score.toString()),
              ],
            );
          },
        );
      },
    );
  }
}
