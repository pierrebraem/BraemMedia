class Media{
  final String title;
  final String imdbID;
  final String urlImage;
  final String annee;

  const Media({
    required this.title,
    required this.imdbID,
    required this.urlImage,
    required this.annee,
});

  factory Media.fromJson(Map<String, dynamic> json){
    return Media(
      title: json['Title'],
      imdbID: json['imdbID'],
      urlImage: json['Poster'],
      annee: json['Year'],
    );
  }
}