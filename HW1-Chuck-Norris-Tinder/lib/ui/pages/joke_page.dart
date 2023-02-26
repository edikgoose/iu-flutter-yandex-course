import 'package:flutter/material.dart';
import 'package:hw1_chuck_norris_tinder/ui/common/joke_card.dart';

import '../common/joke_text.dart';

class JokePage extends StatefulWidget {
  const JokePage({super.key});

  @override
  State createState() => _JokePageState();
}

class _JokePageState extends State<JokePage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              flex: 8,
              child: JokeCard(jokeText: JokeText())
          ),
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: const BorderSide(color: Colors.grey)
                          )
                      )
                  ),

                  child: const Text("Next joke"),
                ),
              )
          )
        ],
      ),
    );
  }
}