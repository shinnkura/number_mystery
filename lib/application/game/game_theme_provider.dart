import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/domain/game/i_game_theme_repository.dart';
import 'package:number_mystery/infrastructure/game/game_theme_repository.dart';

final gameThemeRepositoryProvider = Provider<IGameThemeRepository>((ref) => GameThemeRepository());

final gameThemeProvider = FutureProvider<List<String>>((ref) async {
  final gameThemeRepository = ref.read(gameThemeRepositoryProvider);
  return gameThemeRepository.getThemes();
});
