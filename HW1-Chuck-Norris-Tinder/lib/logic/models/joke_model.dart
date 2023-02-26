class Joke {
  final String id;
  final String content;
  final String url;

  Joke({
    required this.id,
    required this.content,
    required this.url,
  });

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['id'] as String,
      content: json['value'] as String,
      url: json['url'] as String,
    );
  }
}
