import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';
import 'package:number_mystery/presentation/features/game/game_result.dart';
import 'package:number_mystery/presentation/features/game/game_setup.dart';

class GamePage extends ConsumerWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCompleted = ref.watch(gameControllerProvider.select((game) => game.isCompleted));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Mystery'),
      ),
      body: isCompleted ? const GameResultScreen() : const GameSetup(),
      floatingActionButton: FloatingActionButton(
        onPressed: ref.read(gameControllerProvider.notifier).resetGame,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
