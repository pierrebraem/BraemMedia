import 'classes/detail_media.dart';
import 'classes/media.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<DetailMedia>> recupFilmDetail(imdbID) async{
  final reponse = await http.get(Uri.parse("${"https://www.omdbapi.com/?i=" + imdbID}&apikey=8a86d5b2"));

  if(reponse.statusCode == 200){
     final liste = json.decode("[${reponse.body}]") as List<dynamic>;
     return liste.map((data) => DetailMedia.fromJson(data)).toList();
  }
  else{
    throw Exception("Erreur lors de l'appel de l'API");
  }
}

Future<List<Media>> recupFilm(recherche) async{
  final response = await http.get(Uri.parse("${"https://www.omdbapi.com/?s=" + recherche}&type=movie&apikey=8a86d5b2"));

  if(response.statusCode == 200){
    if(json.decode(response.body)['Search'] != null){
      final liste = json.decode(response.body)['Search'] as List;
      return liste.map((data) => Media.fromJson(data)).toList();
    }
    return [];
  }
  else{
    throw Exception("Erreur lors de l'appel de l'API");
  }
}