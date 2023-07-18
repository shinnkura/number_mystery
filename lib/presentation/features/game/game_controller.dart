import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/domain/game/game.dart';

final gameControllerProvider =
    StateNotifierProvider<GameController, Game>((ref) => GameController());

class GameController extends StateNotifier<Game> {
  GameController() : super(Game.initial());

  void startGame(int numberOfPlayers) {
    state = state.start(numberOfPlayers);
  }

  void addPlayer(String name) {
    state = state.addPlayer(name);
  }

  void completeGame() {
    state = state.completeGame();
  }

  void updatePlayerName(int id, String name) {
    state = state.updatePlayerName(id, name);
  }
}
