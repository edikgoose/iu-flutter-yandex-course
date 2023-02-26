import 'package:flutter/material.dart';
import 'package:hw1_chuck_norris_tinder/ui/pages/about_me_page.dart';
import 'package:hw1_chuck_norris_tinder/ui/pages/joke_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      appBar: AppBar(
        title: const Text('Chuck Norris Tinder'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(25),
        child: JokePage()
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.question_mark),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("About author"),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                elevation: 16,
                content: const AboutPage()
              );
            },
          );
        },
      ),
    ),
  );
}
