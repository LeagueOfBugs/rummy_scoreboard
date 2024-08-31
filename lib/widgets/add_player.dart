import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:provider/provider.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({super.key});

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final TextEditingController _controller = TextEditingController();
  String _name = '';

  void _addPlayer() {
    setState(() {
      _name = _controller.value.text;
    });
    Provider.of<PlayerProvider>(context, listen: false).addPlayer(_name);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    print(_name);
    print('in add player');
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 300,
              child: TextField(
                controller: _controller,
              ),
            ),
            ElevatedButton(
              onPressed: () => _addPlayer(),
              child: const Text('Add'),
            ),
          ],
        ),
      ],
    );
  }
}
