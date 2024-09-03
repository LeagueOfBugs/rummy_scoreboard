import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Widget gameCardChildren;
  const GameCard({super.key, required this.gameCardChildren});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Color.fromARGB(255, 2, 153, 224),
      elevation: 10,
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          constraints: const BoxConstraints(
            maxWidth: 200,
            minWidth: 200,
          ),
          child: gameCardChildren),
    );
  }
}
