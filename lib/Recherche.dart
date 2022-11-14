import 'package:flutter/material.dart';

class Recherche extends StatelessWidget{
  const Recherche({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Text('Coucou'),
          ),
        ],
      ),
    );
  }
}