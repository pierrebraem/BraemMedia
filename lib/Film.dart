class Film{
  final String title;
  final String urlImage;
  final String annee;

  const Film({
    required this.title,
    required this.urlImage,
    required this.annee,
});

  factory Film.fromJson(Map<String, dynamic> json){
    return Film(
      title: json['Title'],
      urlImage: json['Poster'],
      annee: json['Year'],
    );
  }
}