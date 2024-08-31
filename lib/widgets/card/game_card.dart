import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Widget gameCardChildren;
  const GameCard({super.key, required this.gameCardChildren});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Container(
            constraints: const BoxConstraints(maxWidth: 500, minWidth: 300),
            child: gameCardChildren));
  }
}
