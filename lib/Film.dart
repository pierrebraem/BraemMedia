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
      title: json['Search'][0]['Title'],
      urlImage: json['Search'][0]['Poster'],
      annee: json['Search'][0]['Year'],
    );
  }
}

const exempleFilm = [
  Film(
    title: 'Star Wars: Episode III - Revenge of the Sith',
    urlImage: 'https://m.media-amazon.com/images/M/MV5BNTc4MTc3NTQ5OF5BMl5BanBnXkFtZTcwOTg0NjI4NA@@._V1_SX300.jpg',
    annee: "2005"
  ),

  Film(
    title: 'Smile',
    urlImage: 'https://m.media-amazon.com/images/M/MV5BZjE2ZWIwMWEtNGFlMy00ZjYzLWEzOWEtYzQ0MDAwZDRhYzNjXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_SX300.jpg',
    annee: "2022"
  ),

  Film(
    title: 'The Bad Guys',
    urlImage: 'https://m.media-amazon.com/images/M/MV5BMDhkYmU0MzctMWEzNy00ODg1LWI3ZjAtMGZlZjkzNWVmMzVjXkEyXkFqcGdeQXVyMTM1MTE1NDMx._V1_SX300.jpg',
    annee: "2022"
  )
];