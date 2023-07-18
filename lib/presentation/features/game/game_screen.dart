import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/presentation/features/game/game_controller.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider);
    // UI will be built here
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Mystery'),
      ),
      body: Center(
        child: Text('Game Screen'),
      ),
    );
  }
}
