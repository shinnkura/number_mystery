import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';

class PlayerNameInput extends ConsumerWidget {
  final int playerId;

  PlayerNameInput({Key? key, required this.playerId, required Null Function(dynamic name) onNameSubmitted}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      onChanged: (value) {
        ref
            .read(gameControllerProvider.notifier)
            .setPlayerName(playerId, value);
      },
      decoration: InputDecoration(
        labelText: 'Player $playerId Name',
      ),
    );
  }
}
