import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/domain/game/game.dart';
import 'package:number_mystery/domain/player/player.dart';

final gameControllerProvider = StateNotifierProvider<GameController, Game>(
  (ref) => GameController(),
);

class GameController extends StateNotifier<Game> {
  GameController() : super(Game.initial());

  void startGame(int numberOfPlayers) {
    final random = Random();
    final players = List.generate(
      numberOfPlayers,
      (index) => Player.initial(index, random.nextInt(100) + 1),
    );
    state = state.copyWith(players: players, isCompleted: false);
  }

  void addPlayer(String name) {
    final players = state.players;
    players.add(Player.initial(players.length, Random().nextInt(100) + 1));
    state = state.copyWith(players: players);
  }

  void completeGame() {
    state = state.copyWith(isCompleted: true);
  }

  void updatePlayerName(int id, String name) {
    final players = state.players.map((player) {
      if (player.id == id) {
        return player.copyWith(name: name);
      } else {
        return player;
      }
    }).toList();
    state = state.copyWith(players: players);
  }

  void resetGame() {
    state = Game.initial();
  }

  void updateGameTheme(String newTheme) {
    state = state.copyWith(theme: newTheme);
  }
}
