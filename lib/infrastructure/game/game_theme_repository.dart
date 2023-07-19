import 'package:number_mystery/domain/game/i_game_theme_repository.dart';

class GameThemeRepository implements IGameThemeRepository {
  @override
  Future<List<String>> getThemes() async {
    // For the sake of simplicity, we will return a hardcoded list of themes.
    // In a real-world application, this data would probably come from an API or a database.
    return ['Default Theme', 'Space Theme', 'Ocean Theme', 'Forest Theme'];
  }
}
