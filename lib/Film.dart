class Film{
  final String title;
  final String imdbID;
  final String urlImage;
  final String annee;

  const Film({
    required this.title,
    required this.imdbID,
    required this.urlImage,
    required this.annee,
});

  factory Film.fromJson(Map<String, dynamic> json){
    return Film(
      title: json['Title'],
      imdbID: json['imdbID'],
      urlImage: json['Poster'],
      annee: json['Year'],
    );
  }
}