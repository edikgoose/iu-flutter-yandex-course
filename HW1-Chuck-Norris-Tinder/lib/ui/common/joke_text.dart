import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw1_chuck_norris_tinder/logic/repositories/http_joke_repository.dart';

import '../../logic/models/joke_model.dart';

class JokeText extends ConsumerStatefulWidget {
  const JokeText({super.key});

  @override
  ConsumerState createState() => _JokeTextState();
}

class _JokeTextState extends ConsumerState<JokeText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: ref.read(httpJokeRepositoryProvider).getRandomJoke(),
        builder: (BuildContext context, AsyncSnapshot<Joke> snapshot) {
          if (snapshot.hasData) {
            Joke? joke = snapshot.data;
            String content = joke?.content ?? "undefined";
            return SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Text(
                  content,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                  ),
                ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
