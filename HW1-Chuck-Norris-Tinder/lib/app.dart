import 'package:flutter/material.dart';
import 'package:hw1_chuck_norris_tinder/ui/home.dart';

class ChuckJokesApp extends StatelessWidget {
  const ChuckJokesApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Tinder Chuck',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const HomeScreen(),
      );
}
