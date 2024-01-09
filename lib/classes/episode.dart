class Episode{
  final String title;
  final String episode;
  final String released;

  const Episode({
    required this.title,
    required this.episode,
    required this.released
  });

  factory Episode.fromJson(Map<String, dynamic> json){
    return Episode(
      title: json['Title'],
      episode: json['Episode'],
      released: json['Released']
    );
  }
}