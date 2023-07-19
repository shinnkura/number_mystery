import 'package:number_mystery/domain/game/i_game_theme_repository.dart';

class GameThemeRepository implements IGameThemeRepository {
  @override
  Future<List<String>> getThemes() async {
    // This is just a mock implementation. In a real app, you would fetch the themes from a remote server or a local database.
    return ['Theme 1', 'Theme 2', 'Theme 3'];
  }
}
