import 'package:flutter/material.dart';
import 'classes/media.dart';
import 'pages/recherche.dart';
import 'fonctions.dart' as fonctions;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

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
  late Future<List<Media>> listeFilm;

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
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if(controller.text.length < 3){
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Erreur de saisie'),
                    content: const Text('Votre saisie doit comporter 3 caractères ou plus'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  )
                );
              }
              else{
                listeFilm = fonctions.recupFilm(controller.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Recherche(listeFilm: listeFilm)),
                );
              }
            },
            child: const Text('Rechercher'),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: const Text('Version 1.0.1')
            ) 
          )
        ],
      ),
    );
  }
}