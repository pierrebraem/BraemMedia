import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'FilmDetail.dart';

Future<List<FilmDetail>> recupFilmDetail(imdbID) async{
  final reponse = await http.get(Uri.parse("https://www.omdbapi.com/?i=" + imdbID + "&apikey=8a86d5b2"));

  if(reponse.statusCode == 200){
     final liste = json.decode("[" + reponse.body + "]") as List<dynamic>;
     return liste.map((data) => FilmDetail.fromJson(data)).toList();
  }
  else{
    throw Exception("Erreur lors de l'appel de l'API");
  }
}

class Detail extends StatelessWidget{
  Detail({super.key, required this.imdbID});

  final dynamic imdbID;
  late Future<List<FilmDetail>> filmDetail = recupFilmDetail(imdbID);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: FutureBuilder(
          future: filmDetail,
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView(
                children: <Widget>[
                  Container(
                    padding: (
                        EdgeInsets.only(left: 20, top: 20)
                    ),
                  ),
                  Text("${(snapshot.data as dynamic)[0].title}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan, fontSize: 40.0)),
                  Text("${(snapshot.data as dynamic)[0].released}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Text("${(snapshot.data as dynamic)[0].genre}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Image.network("${(snapshot.data as dynamic)[0].urlImage}", width: 300, height: 300),
                  Text("${(snapshot.data as dynamic)[0].plot}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Text("Notation : " + "${(snapshot.data as dynamic)[0].rated}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Text("Durée : " + "${(snapshot.data as dynamic)[0].runtime}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Text("Directeur : " + "${(snapshot.data as dynamic)[0].director}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Text("Écriture : " + "${(snapshot.data as dynamic)[0].writer}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Text("Acteurs : " + "${(snapshot.data as dynamic)[0].actors}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Text("Note métacritic : " + "${(snapshot.data as dynamic)[0].metascore}" + "/100", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  Text("DVD : " + "${(snapshot.data as dynamic)[0].dvd}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                  //Text("BoxOffice: " + "${(snapshot.data as dynamic)[0].BoxOffice}" , textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
                ]
              );
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }
        )
        /* children: <Widget>[
          Container(
            padding: (
                EdgeInsets.only(left: 20, top: 20)
            ),
          ),
          Text("Smile", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan, fontSize: 40.0)),
          Text("30 Sep 2022", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("Horreur", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Image.network("https://m.media-amazon.com/images/M/MV5BZjE2ZWIwMWEtNGFlMy00ZjYzLWEzOWEtYzQ0MDAwZDRhYzNjXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_SX300.jpg", width: 300, height: 300),
          Text("After witnessing a bizarre, traumatic incident involving a patient, Dr. Rose Cotter starts experiencing frightening occurrences that she can't explain. Rose must confront her troubling past in order to survive and escape her horri...", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("Notation : R", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("Durée : 115 min", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("Directeur : Parker Finn", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("Écriture : Parker Finn", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("Acteurs : Sosie Bacon, Jessie T. Usher, Kyle Gallner", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("Note métacritic : 68/100", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("DVD : Pas de DVD sorti", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Text("BoxOffice: \$99,453,841", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
        ], */
      ),
    );
  }
}