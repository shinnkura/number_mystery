import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/player/player_controller.dart';

class PlayerScreen extends ConsumerWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerController = ref.watch(playerControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Player ${playerController.id + 1}'),
      ),
      body: Column(
        children: [
          Text('Name: ${playerController.name}'),
          Text('Number: ${playerController.number}'),
        ],
      ),
    );
  }
}
