import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';
import 'package:number_mystery/application/game/game_theme_provider.dart';

class ThemeSetup extends ConsumerWidget {
  const ThemeSetup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider.notifier);
    final themes = ref.watch(gameThemeProvider);
    return themes.when(
      data: (themes) {
        return DropdownButton<String>(
          value: ref.watch(gameControllerProvider.select((game) => game.theme)),
          onChanged: (value) => gameController.updateGameTheme(value!),
          items: themes.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        );
      },
      loading: () => CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}
