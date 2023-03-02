import 'dart:math';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class JokePic extends StatefulWidget {
  const JokePic({super.key});
  Future<Uint8List> getImageBytes() async {
    http.Response response = await get(Uri.parse("https://picsum.photos/200?"));
    return response.bodyBytes;
  }

  @override
  State createState() => _JokePicState();
}

class _JokePicState extends State<JokePic> {
  final _imageUrl = "https://source.unsplash.com/random/";
  final _random = Random();

  @override
  Widget build(BuildContext context) {
    return Image.network(_imageUrl + _random.nextInt(200).toString(),
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity, loadingBuilder: (BuildContext context,
            Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) return child;
      return const Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
