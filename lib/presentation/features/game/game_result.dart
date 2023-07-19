import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';

class GameResultScreen extends ConsumerWidget {
  const GameResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Result'),
      ),
      body: ListView.builder(
        itemCount: gameController.players.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(gameController.players[index].name),
            trailing: Text(gameController.players[index].number.toString()),
          );
        },
      ),
    );
  }
}
