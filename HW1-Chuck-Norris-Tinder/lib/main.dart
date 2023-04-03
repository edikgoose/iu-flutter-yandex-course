import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hw1_chuck_norris_tinder/app.dart';

void main() {
  runApp(const ProviderScope(
      child: ChuckJokesApp()
  ));
}
