import 'package:flutter/material.dart';

class Detail extends StatelessWidget{
  const Detail({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: ListView(
        children: <Widget>[
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
        ],
      ),
    );
  }
}