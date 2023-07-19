import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';

class PlayerEntry extends ConsumerWidget {
  final int playerId;

  const PlayerEntry({Key? key, required this.playerId}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.read(gameControllerProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: const InputDecoration(
          labelText: 'Enter player name',
        ),
        onSubmitted: (value) {
          gameController.updatePlayerName(playerId, value);
        },
      ),
    );
  }
}
