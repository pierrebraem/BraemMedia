import 'package:flutter/material.dart';
import 'Film.dart';
import 'Recherche.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'APIFilm',
      home: Accueil(),
    );
  }
}

class Accueil extends StatefulWidget{
  const Accueil({Key? key}) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil>{
  final controller = TextEditingController();
  List<Film> films = exempleFilm;

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

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
          /* ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Recherche()),
              );
            },
            child: Text('Rechercher'),
          ), */
          ElevatedButton(
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
          ),
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