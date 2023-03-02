import 'package:json_annotation/json_annotation.dart';

part 'joke_model.g.dart';

@JsonSerializable()
class Joke {
  final String id;
  @JsonKey(name: "value")
  final String content;
  final String url;

  Joke({
    required this.id,
    required this.content,
    required this.url,
  });

  factory Joke.fromJson(Map<String, dynamic> json) => _$JokeFromJson(json);

  Map<String, dynamic> toJson() => _$JokeToJson(this);
}
