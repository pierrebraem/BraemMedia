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
          Text('Smile', textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan, fontSize: 40.0)),
          Text('2022', textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
          Image.network('https://m.media-amazon.com/images/M/MV5BZjE2ZWIwMWEtNGFlMy00ZjYzLWEzOWEtYzQ0MDAwZDRhYzNjXkEyXkFqcGdeQXVyMTUzMTg2ODkz._V1_SX300.jpg', width: 300, height: 300),
          Text('Une description', textAlign: TextAlign.center, style: TextStyle(color: Colors.cyan)),
        ],
      ),
    );
  }
}