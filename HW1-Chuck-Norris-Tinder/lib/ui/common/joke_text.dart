import 'package:flutter/material.dart';
import 'package:hw1_chuck_norris_tinder/main.dart';

import '../../logic/models/joke_model.dart';

class JokeText extends StatefulWidget {
  const JokeText({super.key});

  @override
  State createState() => _JokeTextState();
}

class _JokeTextState extends State<JokeText> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder(
        future: httpJokeRepository.getRandomJoke(),
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
