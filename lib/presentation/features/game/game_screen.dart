import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:number_mystery/application/game/game_controller.dart';

class GameScreen extends ConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameController = ref.watch(gameControllerProvider);

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
                        final editController = TextEditingController(
                            text: gameController.players[index].name);
                        return AlertDialog(
                          title: Text('Edit Player Name'),
                          content: TextField(
                            controller: editController,
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
                                    .setPlayerName(index, editController.text);
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.visibility),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Your Number'),
                            content: Text(
                                'Your number is ${gameController.players[index].number}. Please remember it and do not share with others.'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
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
              final numController = TextEditingController();
              return AlertDialog(
                title: Text('Start Game'),
                content: TextField(
                  controller: numController,
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
                          .startGame(int.parse(numController.text));
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
