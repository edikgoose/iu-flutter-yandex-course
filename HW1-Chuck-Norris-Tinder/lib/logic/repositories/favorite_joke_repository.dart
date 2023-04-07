import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/joke_model.dart';

final favoriteJokeRepositoryProvider = Provider<FavoriteJokeRepository>((ref) {
  return FavoriteJokeRepository();
});

class FavoriteJokeRepository {
  final _databaseReference =
      FirebaseDatabase.instance.reference().child("jokes");

  void saveJoke(Joke joke) {
    _databaseReference.push().set(joke.toJson());
  }

  Future<bool> containsJoke(Joke joke) {
    return _databaseReference.get().then((snapshot) {
      Map<dynamic, dynamic> jokeMap = snapshot.value;
      for (final currentJoke in jokeMap.values) {
        if (currentJoke["id"] == joke.id) {
          return true;
        }
      }
      return false;
    }).onError((error, stackTrace) {
      return false;
    });
  }

  Future<List<Joke>> getFavoriteJokes() {
    return _databaseReference.get().then((snapshot) {
      List<Joke> favoriteJokes = <Joke>[];
      Map<dynamic, dynamic> jokeMap = snapshot.value;
      for (final currentJoke in jokeMap.values) {
        favoriteJokes.add(Joke(
            id: currentJoke["id"],
            content: currentJoke["value"],
            url: currentJoke["url"]));
      }
      return favoriteJokes;
    }).onError((error, stackTrace) {
      return [];
    });
  }

  Future<void> removeFavoriteJoke(String id) async {
    String dbId = await _databaseReference.get().then((snapshot) {
      Map<dynamic, dynamic> jokeMap = snapshot.value;
      for (final currentJokeEntry in jokeMap.entries) {
        if (currentJokeEntry.value["id"] == id) {
          return currentJokeEntry.key;
        }
      }
      throw Error();
    }).onError((error, stackTrace) { print(error); throw error!;});

    print("ID: $dbId");
    await _databaseReference.child(dbId).remove();
  }
}
