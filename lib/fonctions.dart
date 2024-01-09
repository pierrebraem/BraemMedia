import 'classes/detail_media.dart';
import 'classes/media.dart';
import 'classes/episode.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<DetailMedia> recupDetailMedia(imdbID) async{
  final response = await http.get(Uri.parse("https://www.omdbapi.com/?i=$imdbID&apikey=8a86d5b2"));

  if(response.statusCode == 200){
    final liste = json.decode("[${response.body}]") as List;
    DetailMedia detail = DetailMedia.fromJson(liste[0]);
    
    String? totalSeason = detail.totalSeason;
    if(detail.type == 'series' && totalSeason != null && totalSeason != "N/A"){
      final listeEpisodes = await recupEpisodes(imdbID, int.parse(totalSeason));
      detail.episodes = listeEpisodes;
    }

    return detail;
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

Future<List<Episode>> recupEpisodes(imdbID, totalSaison) async{
  List<Episode> liste = [];

    for(int i = 1; i <= totalSaison; i++){
      var response = await http.get(Uri.parse("https://www.omdbapi.com/?i=$imdbID&season=$i&apikey=8a86d5b2"));
      if(response.statusCode == 200){
        if(json.decode(response.body)['Episodes'] != null){
          var saison = json.decode(response.body)['Episodes'] as List;
          saison.map((data) => liste.add(Episode.fromJson(data))).toList();
        }
      }
      else{
        throw Exception("Erreur lors de l'appel de l'API");
      }
    }

  return liste;
}