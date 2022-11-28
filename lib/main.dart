import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Film.dart';
import 'Recherche.dart';

Future<Film> recupFilm() async{
  final response = await http.get(Uri.parse("https://www.omdbapi.com/?s=Star%20Wars&type=movie&apikey=8a86d5b2"));

  if(response.statusCode == 200){
    return Film.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception("Erreur lors de l'appel de l'API");
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APIFilm',
      home: Execution(),
    );
  }
}

class Execution extends StatefulWidget{
  const Execution({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Execution>{
  final controller = TextEditingController();
  List<Film> films = exempleFilm;
  late Future<Film> listeFilm;

  @override
  void initState(){
    super.initState();
    listeFilm = recupFilm();
  }

  /* @override
  void dispose(){
    controller.dispose();
    super.dispose();
  } */

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("APIFilm"),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Nom du film',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.black),
                ),
              ),
              onChanged: rechercheFilm,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: films.length,
              itemBuilder: (context, index){
                final film = films[index];

                return ListTile(
                  leading: Image.network(
                    film.urlImage,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(film.title),
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Recherche(listeFilm: listeFilm)),
              );
            },
            child: Text('Rechercher'),
          ),
          /* ElevatedButton(
            onPressed: (){
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    content: Text(controller.text),
                  );
                }
              );
            },
            child: Text("Rechercher"),
          ), */
        ],
      ),
    );
  }
  void rechercheFilm(String query){
    final suggestions = exempleFilm.where((film){
      final titre = film.title.toLowerCase();
      final input = query.toLowerCase();

      return titre.contains(input);
    }).toList();

    setState(() => films = suggestions);
  }
}