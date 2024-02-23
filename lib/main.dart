import 'package:flutter/material.dart';

void main() => runApp(const BraemMedia());

class BraemMedia extends StatelessWidget{
  const BraemMedia({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: FilledButton(
                  onPressed: null, 
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue), fixedSize: MaterialStatePropertyAll<Size>(Size(200, 60))), 
                  child: Text('Connexion', style: TextStyle(fontSize: 20))
                )
              ),
              FilledButton(
                onPressed: null, 
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.grey), fixedSize: MaterialStatePropertyAll<Size>(Size(200, 60))), 
                child: Text('Inscription', style: TextStyle(fontSize: 20))
              )
            ]
          )
        )
      )
    );
  }
}