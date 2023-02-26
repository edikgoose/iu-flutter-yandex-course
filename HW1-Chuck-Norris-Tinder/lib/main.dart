import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:hw1_chuck_norris_tinder/app.dart';

import 'logic/repositories/http_joke_repository.dart';

void main() {
  registerSingletons();
  runApp(const ChuckJokesApp());
}

void registerSingletons() {
  GetIt.I.registerLazySingleton(() => HttpJokeRepository(client: http.Client()));
}

final _get = GetIt.I.get;
HttpJokeRepository get httpJokeRepository => _get<HttpJokeRepository>();