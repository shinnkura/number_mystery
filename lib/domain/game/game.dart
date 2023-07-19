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
}
