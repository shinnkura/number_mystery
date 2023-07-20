import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider);
    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Number Mystery Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: gameController.players.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(gameController.players[index].name),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        final _editController = TextEditingController(
                            text: gameController.players[index].name);
                        return AlertDialog(
                          title: Text('Edit Player Name'),
                          content: TextField(
                            controller: _editController,
                            decoration: InputDecoration(
                              labelText: 'Enter new player name',
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text('Cancel'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Save'),
                              onPressed: () {
                                ref
                                    .read(gameControllerProvider.notifier)
                                    .setPlayerName(index, _editController.text);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              final _numController = TextEditingController();
              return AlertDialog(
                title: Text('Start Game'),
                content: TextField(
                  controller: _numController,
                  decoration: InputDecoration(
                    labelText: 'Enter number of players',
                  ),
                  keyboardType: TextInputType.number,
                ),
                actions: <Widget>[
                  TextButton(
                    child: Text('Cancel'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Text('Start'),
                    onPressed: () {
                      ref
                          .read(gameControllerProvider.notifier)
                          .startGame(int.parse(_numController.text));
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
