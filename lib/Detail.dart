import 'package:flutter/material.dart';
import 'Film.dart';

class Detail extends StatelessWidget{
  const Detail({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
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