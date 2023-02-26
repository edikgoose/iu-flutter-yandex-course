import '../models/joke_model.dart';

abstract class JokeRepository {
  Future<Joke> getJoke();
}