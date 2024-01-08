import 'classes/detail_media.dart';
import 'classes/media.dart';
import 'classes/episode.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<DetailMedia> recupDetailMedia(imdbID) async{
  final reponse = await http.get(Uri.parse("https://www.omdbapi.com/?i=$imdbID&apikey=8a86d5b2"));

  final List<Episode> listeEpisodes = [
    const Episode(title: "Salut", episode: "1", released: "2023-10-10"), 
    const Episode(title: "Comment", episode: "2", released: "2023-10-11"),
    const Episode(title: "Tu vas", episode: "3", released: "2023-11-13"),
    const Episode(title: "Toi?", episode: "4", released: "2023-12-01"),
    const Episode(title: "Moi, ca va", episode: "5", released: "2023-12-02"),
    const Episode(title: "Et toi?", episode: "6", released: "2023-12-25"),
    const Episode(title: "Ecoute, moi", episode: "7", released: "2023-12-31"),
    const Episode(title: "ça va super", episode: "8", released: "2024-01-01"),
    const Episode(title: "Bien", episode: "9", released: "2024-01-08")
  ];

  if(reponse.statusCode == 200){
     final liste = json.decode("[${reponse.body}]") as List;
     DetailMedia detail = DetailMedia.fromJson(liste[0]);
     detail.episodes = listeEpisodes;
     return detail;
     //return liste.map((data) => DetailMedia.fromJson(data)).toList();
  }
  else{
    throw Exception("Erreur lors de l'appel de l'API");
  }
}

Future<List<Media>> recupMedia(recherche, type) async{
  String url = "";
  if(type == 'all'){
    url = "https://www.omdbapi.com/?s=$recherche&apikey=8a86d5b2";
  }
  else{
    url = "https://www.omdbapi.com/?s=$recherche&type=$type&apikey=8a86d5b2";
  }
  final response = await http.get(Uri.parse(url));

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