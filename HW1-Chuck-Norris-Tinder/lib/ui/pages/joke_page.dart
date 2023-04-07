import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw1_chuck_norris_tinder/logic/models/joke_model.dart';
import 'package:hw1_chuck_norris_tinder/logic/repositories/favorite_joke_repository.dart';
import 'package:hw1_chuck_norris_tinder/ui/common/joke_card.dart';
import 'package:hw1_chuck_norris_tinder/ui/common/joke_pic.dart';

import '../common/joke_text.dart';

typedef JokeCallback = void Function(Joke joke);

class JokePage extends ConsumerStatefulWidget {
  const JokePage({super.key});

  @override
  ConsumerState createState() => _JokePageState();
}

class _JokePageState extends ConsumerState<JokePage> {
  late Joke _currentJoke;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          // Not const because in case it will rebuild JokeText and JokePic.
          // I'm sure that there is a better solution for it, but so far I haven't been able to find it
          Expanded(
              flex: 8,
              child: JokeCard(
                jokeText: JokeText(jokeCallback: (joke) => _currentJoke = joke),
                jokePic: JokePic(),
              )),
          Expanded(
              flex: 1,
              child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {});
                          },
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.grey)))),
                          child: const Text("Next"),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          ref
                              .read(favoriteJokeRepositoryProvider)
                              .containsJoke(_currentJoke)
                              .then((isContains) {
                            if (!isContains) {
                              ref
                                  .read(favoriteJokeRepositoryProvider)
                                  .saveJoke(_currentJoke);
                            } else {
                              final scaffold = ScaffoldMessenger.of(context);
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: const Text("Already saved"),
                                action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
                              ));
                            }
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side:
                                        const BorderSide(color: Colors.grey)))),
                        child: const Text("Save"),
                      ),
                    ],
                  ))))
        ],
      ),
    );
  }
}
