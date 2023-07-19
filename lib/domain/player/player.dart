import 'package:freezed_annotation/freezed_annotation.dart';

part 'player.freezed.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required int id,
    required String name,
    required int number,
  }) = _Player;

  factory Player.initial(int id, int number) => Player(
        id: id,
        name: 'Player ${id + 1}',
        number: number,
      );
}
