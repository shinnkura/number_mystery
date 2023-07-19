import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';
// import 'package:number_mystery/application/player/player_controller.dart';
import 'package:number_mystery/presentation/features/player/player_screen.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Number Mystery Game'),
      ),
      body: ListView.builder(
        itemCount: gameController.players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(gameController.players[index].name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProviderScope(
                    overrides: [
                      // playerControllerProvider.overrideWithValue(gameController.players[index]),
                    ],
                    child: PlayerScreen(),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => gameController.startGame(5),
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
