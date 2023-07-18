import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/presentation/features/game/game_controller.dart';

class GameStart extends ConsumerWidget {
  const GameStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.read(gameControllerProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Enter number of players',
        ),
        keyboardType: TextInputType.number,
        onSubmitted: (value) {
          final numberOfPlayers = int.tryParse(value);
          if (numberOfPlayers != null) {
            gameController.startGame(numberOfPlayers);
          }
        },
      ),
    );
  }
}
