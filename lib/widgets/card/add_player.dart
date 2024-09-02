import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:flutter_application_1/widgets/card/game_card.dart';
import 'package:provider/provider.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({super.key});

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final List<TextEditingController> _controllers = [];

  @override
  void initState() {
    super.initState();
    addPlayerInput();
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void addPlayerInput() {
    setState(() => _controllers.add(TextEditingController()));
  }

  void startGame() {
    for (var controller in _controllers) {
      if (controller.text.isNotEmpty) {
        Provider.of<PlayerProvider>(context, listen: false)
            .addPlayer(controller.text);
      }
    }
    Provider.of<PlayerProvider>(context, listen: false).startGame();
  }

  @override
  Widget build(BuildContext context) {
    return GameCard(
      gameCardChildren: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ..._controllers.map((controller) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  controller: controller,
                  decoration:
                      const InputDecoration(hintText: 'Enter player name'),
                ),
              );
            }),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: addPlayerInput,
                  child: const Text('Add Player'),
                ),
                const SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: startGame,
                  child: const Text('Start Game'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
