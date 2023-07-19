import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';
import 'package:number_mystery/presentation/features/player/player_setup.dart';
import 'package:number_mystery/presentation/features/game/theme_setup.dart';

class GameSetup extends ConsumerWidget {
  const GameSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider.notifier);
    return Column(
      children: [
        TextField(
          onChanged: (value) => gameController.startGame(int.parse(value)),
          decoration: InputDecoration(
            labelText: 'Number of Players',
          ),
        ),
        const PlayerSetup(),
        const ThemeSetup(),
        ElevatedButton(
          onPressed: gameController.completeGame,
          child: const Text('Complete Setup'),
        ),
      ],
    );
  }
}
