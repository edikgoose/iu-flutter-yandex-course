import 'package:flutter/material.dart';
import 'package:hw1_chuck_norris_tinder/ui/common/joke_text.dart';

class JokeCard extends StatefulWidget {
  const JokeCard({super.key, required this.jokeText});

  final JokeText? jokeText;
  
  @override
  State<StatefulWidget> createState() => _JokeCardState();
}

class _JokeCardState extends State<JokeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.all(25),
              child: Image.asset("assets/images/croco.jpg"),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
                color: Colors.white,
                padding: const EdgeInsets.all(25),
                alignment: Alignment.bottomCenter,
                child: widget.jokeText
            ),
          ),
        ],
      ),
    );
  }

}