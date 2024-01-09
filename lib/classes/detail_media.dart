import '../classes/episode.dart';

class DetailMedia{
  final String title;
  final String type;
  final String urlImage;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String metascore;
  List<List<Episode>>? episodes;
  final String? totalSeason;
  final String? dvd;

  DetailMedia({
    required this.title,
    required this.type,
    required this.urlImage,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.metascore,
    this.episodes,
    this.totalSeason,
    this.dvd
  });

  factory DetailMedia.fromJson(Map<String, dynamic> json){
    return DetailMedia(
      title: json['Title'],
      type: json['Type'],
      urlImage : json['Poster'],
      rated: json['Rated'],
      released: json['Released'],
      runtime: json['Runtime'],
      genre: json['Genre'],
      director: json['Director'],
      writer: json['Writer'],
      actors: json['Actors'],
      plot: json['Plot'],
      metascore: json['Metascore'],
      totalSeason: json['totalSeasons'],
      dvd: json['DVD']
    );
  }
}