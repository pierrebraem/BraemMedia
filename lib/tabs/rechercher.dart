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
          )
        ]
      )
    );
  }
}