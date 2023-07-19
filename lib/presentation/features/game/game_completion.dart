import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';

class GameCompletion extends ConsumerWidget {
  const GameCompletion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.read(gameControllerProvider.notifier);
    return ElevatedButton(
      onPressed: gameController.completeGame,
      child: const Text('Complete Game'),
    );
  }
}