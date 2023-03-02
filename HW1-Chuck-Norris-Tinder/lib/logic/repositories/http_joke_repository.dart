import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/joke_model.dart';
import 'joke_repository.dart';

class HttpJokeRepository implements JokeRepository {
  HttpJokeRepository({required this.client});

  final http.Client client;
  final Uri getJokeUri = Uri.parse("https://api.chucknorris.io/jokes/random");

  @override
  Future<Joke> getRandomJoke() async {
    http.Response res = await client.get(getJokeUri);

    if (res.statusCode == 200) {
      dynamic body = jsonDecode(res.body);
      Joke joke = Joke.fromJson(body);
      return joke;
    } else {
      throw "Unable to retrieve joke";
    }
  }
}
