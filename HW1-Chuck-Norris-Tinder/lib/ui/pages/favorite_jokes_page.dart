import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw1_chuck_norris_tinder/logic/models/joke_model.dart';
import 'package:hw1_chuck_norris_tinder/logic/repositories/favorite_joke_repository.dart';

class FavoriteJokesPage extends ConsumerStatefulWidget {
  const FavoriteJokesPage({super.key});

  @override
  ConsumerState createState() => _FavoriteJokesPageState();
}

class _FavoriteJokesPageState extends ConsumerState<FavoriteJokesPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: ref.read(favoriteJokeRepositoryProvider).getFavoriteJokes(),
        builder: (BuildContext context, AsyncSnapshot<List<Joke>> snapshot) {
          if (snapshot.hasData) {
            List<Joke> jokes = snapshot.data ?? [];
            return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: jokes.length,
              separatorBuilder: (BuildContext context, int index) => const Divider(),
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  child:  Container(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(jokes[index].content, style: const TextStyle(fontSize: 22)),
                        ],
                      )
                  ),
                  onLongPress: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Delete?'),
                          actions: [
                            IconButton(
                                onPressed: () async {
                                  Navigator.pop(context);
                                  await ref.read(favoriteJokeRepositoryProvider).removeFavoriteJoke(jokes[index].id);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.check))
                          ],
                        ));
                  },
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    );
  }
}
