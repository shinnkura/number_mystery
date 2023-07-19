import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/domain/player/player.dart';

final playerControllerProvider = StateNotifierProvider<PlayerController, Player>((ref) => PlayerController());

class PlayerController extends StateNotifier<Player> {
  PlayerController() : super(Player.initial(0, 0));

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateNumber(int number) {
    state = state.copyWith(number: number);
  }
}
