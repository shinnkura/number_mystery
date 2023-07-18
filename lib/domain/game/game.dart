import 'dart:math';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:number_mystery/domain/game/player.dart';

part 'game.freezed.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required List<Player> players,
    required bool isCompleted,
  }) = _Game;

  factory Game.initial() => Game(
        players: [],
        isCompleted: false,
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
    // Add player
    return this;
  }

  Game completeGame() {
    // Complete game
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
}
