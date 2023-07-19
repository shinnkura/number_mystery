import 'package:flutter/material.dart';
import 'package:number_mystery/domain/player/player.dart';

class PlayerCard extends StatelessWidget {
  final Player player;
  const PlayerCard({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(player.number.toString()),
        title: Text(player.name),
      ),
    );
  }
}
