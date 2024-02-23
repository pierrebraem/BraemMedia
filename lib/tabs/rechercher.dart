import 'package:flutter/material.dart';

class RechercherPage extends StatefulWidget{
  const RechercherPage({super.key});

  @override
  State<RechercherPage> createState() => _RechercherPageState();
}

class _RechercherPageState extends State<RechercherPage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Entrez le nom d\'un média',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.black)
              )
            )
          ),
          const ElevatedButton(
            onPressed: null, child: Text('Rechercher')
          ),
          const Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.live_tv),
                  title: Text('Breaking Bad'),
                  subtitle: Text('Série - 2008-01-20 - 6 saisons')
                )
              ]
            )
          ),
          const Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text('Five nights at Freddy\'s'),
                  subtitle: Text('Film - 2023-11-08 - 110 min')
                )
              ]
            )
          ),
          const Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.videogame_asset),
                  title: Text('Super Mario Bros'),
                  subtitle: Text('Jeu-vidéo - 1985-09-13')
                )
              ]
            )
          )
        ]
      )
    );
  }
}