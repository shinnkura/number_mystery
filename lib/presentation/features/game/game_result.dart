import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/presentation/features/game/game_controller.dart';

class GameResult extends ConsumerWidget {
  const GameResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider);
    return ListView.builder(
      itemCount: gameController.players.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(gameController.players[index].name),
          trailing: Text(gameController.players[index].number.toString()),
        );
      },
    );
  }
}