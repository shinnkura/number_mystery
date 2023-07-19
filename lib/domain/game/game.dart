import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:number_mystery/domain/player/player.dart';

part 'game.freezed.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required List<Player> players,
    required bool isCompleted,
    required String theme,
  }) = _Game;

  factory Game.initial() => Game(
        players: [],
        isCompleted: false,
        theme: 'Default Theme',
      );

  Game start(int numberOfPlayers) {
    final random = Random();
    final players = List.generate(
      numberOfPlayers,
      (index) => Player.initial(index, random.nextInt(100) + 1),
    );
    return copyWith(players: players, isCompleted: false);
  }

  Game addPlayer(String name) {
    final players = this.players;
    players.add(Player.initial(players.length, Random().nextInt(100) + 1));
    return copyWith(players: players);
  }

  Game completeGame() {
    return copyWith(isCompleted: true);
  }

  Game updatePlayerName(int id, String name) {
    final players = this.players.map((player) {
      if (player.id == id) {
        return player.copyWith(name: name);
      } else {
        return player;
      }
    }).toList();
    return copyWith(players: players);
  }

  startGame(int i) {}
}
