import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/player_provider.dart';
import 'package:flutter_application_1/widgets/card/add_player.dart';
import 'package:flutter_application_1/widgets/card/leaderboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => PlayerProvider())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey.shade400,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 10, 1, 39)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    print('in main');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          // Conditionally add a widget using an if statement
          (Provider.of<PlayerProvider>(context).players.isEmpty)
              ? const AddPlayer()
              : const Leaderboard(),
          TextButton(
              onPressed: () {
                Provider.of<PlayerProvider>(context, listen: false)
                    .clearPlayers();
              },
              child: const Text('clear players'))
        ],
      ),
    );
  }
}
