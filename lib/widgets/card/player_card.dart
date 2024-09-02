import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/player.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:flutter_application_1/widgets/card/game_card.dart';
import 'package:number_text_input_formatter/number_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PlayerCard extends StatefulWidget {
  final Player player;
  const PlayerCard({super.key, required this.player});

  @override
  State<PlayerCard> createState() => _PlayerCardState();
}

class _PlayerCardState extends State<PlayerCard> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _updatePlayerScore() {
    if (_controller.text.isNotEmpty) {
      Provider.of<PlayerProvider>(context, listen: false)
          .updateScore(widget.player.name, int.parse(_controller.text));
      _controller.clear();
    }
  }

  void _addToInput(int valueToAdd) {
    // Get the current text from the controller
    String currentText = _controller.text;

    // Try to parse the current text as an integer
    int? currentValue = int.tryParse(currentText.replaceAll(',', ''));

    if (currentValue != null) {
      // If parsing is successful, add the value
      int newValue = currentValue + valueToAdd;

      // Update the controller with the new value
      _controller.value = TextEditingValue(
        text: newValue.toString(),
        selection: TextSelection.fromPosition(
          TextPosition(offset: newValue.toString().length),
        ),
      );
    } else {
      // If parsing fails, just add the value as a new entry
      _controller.value = TextEditingValue(
        text: valueToAdd.toString(),
        selection: TextSelection.fromPosition(
          TextPosition(offset: valueToAdd.toString().length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GameCard(
      gameCardChildren: Column(
        children: [
          Text(widget.player.name),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Colors.orange.shade300),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 150.0,
                      height: 50.0,
                      child: TextField(
                        controller: _controller,
                        inputFormatters: [
                          NumberTextInputFormatter(
                            integerDigits: 10,
                            maxValue: '1000',
                            groupDigits: 3,
                            groupSeparator: ',',
                            allowNegative: true,
                            insertDecimalDigits: false,
                          ),
                        ],
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter number',
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: _updatePlayerScore,
                    child: const Text('Update Button'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _addToInput(50);
                    },
                    child: const Text("cut"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _addToInput(100);
                    },
                    child: const Text("RUMMY!"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
