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
                  (snapshot.data as dynamic)[0].urlImage != "N/A"? Image.network("${(snapshot.data as dynamic)[0].urlImage}", width: 300, height: 300) : Image.asset('assets/images/non_images.png', width: 300, height: 300),
                  (snapshot.data as dynamic)[0].plot != "N/A"? Text("${(snapshot.data as dynamic)[0].plot}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)) : Text(""),
                  (snapshot.data as dynamic)[0].rated != "N/A"? Text("Notation : " + "${(snapshot.data as dynamic)[0].rated}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)) : Text(""),
                  (snapshot.data as dynamic)[0].runtime != "N/A"? Text("Durée : " + "${(snapshot.data as dynamic)[0].runtime}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)) : Text(""),
                  (snapshot.data as dynamic)[0].director != "N/A"? Text("Directeur : " + "${(snapshot.data as dynamic)[0].director}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)) : Text(""),
                  (snapshot.data as dynamic)[0].writer != "N/A"? Text("Écriture : " + "${(snapshot.data as dynamic)[0].writer}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)) : Text(""),
                  (snapshot.data as dynamic)[0].actors != "N/A"? Text("Acteurs : " + "${(snapshot.data as dynamic)[0].actors}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)) : Text(""),
                  (snapshot.data as dynamic)[0].metascore != "N/A"? Text("Note métacritic : " + "${(snapshot.data as dynamic)[0].metascore}" + "/100", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)) : Text(""),
                  (snapshot.data as dynamic)[0].dvd != "N/A"? Text("DVD : " + "${(snapshot.data as dynamic)[0].dvd}", textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)) : Text(""),
                ]
              );
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }
        )
      ),
    );
  }
}