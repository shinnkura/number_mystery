import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';

class PlayerSetup extends ConsumerWidget {
  const PlayerSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider.notifier);
    final players = ref.watch(gameControllerProvider.select((game) => game.players));
    return ListView.builder(
      itemCount: players.length,
      itemBuilder: (context, index) {
        return TextField(
          onChanged: (value) => gameController.updatePlayerName(index, value),
          decoration: InputDecoration(
            labelText: 'Player ${index + 1} Name',
          ),
        );
      },
    );
  }
}
