import 'package:apifilm/main.dart';
import 'package:flutter/material.dart';
import 'Film.dart';
import 'Detail.dart';

class Recherche extends StatelessWidget{
  const Recherche({super.key, required this.listeFilm});

  final Future<Film> listeFilm;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recherche'),
      ),
      body: Center(
        child: FutureBuilder<Film>(
          future: listeFilm,
          builder: (context, snapshot){
            if(snapshot.hasData){
              return Text(snapshot.data!.title + ' ' + snapshot.data!.urlImage + ' ' + snapshot.data!.annee);
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          }
        )
        /* separatorBuilder: (context, index) => Divider(color: Colors.cyan),
        itemCount: exempleFilm.length,
        itemBuilder: (context, index){
          final film = exempleFilm[index];
          return ListTile(
            title: Text(
              '${film.title}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.cyan,
                fontSize: 20),
              ),
            subtitle: Text(
              '${film.annee}',
              textAlign: TextAlign.center,
            ),
            leading: Image.network(
                film.urlImage,
                fit: BoxFit.cover,
                width: 50,
                height: 50,
            ),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Detail()),
              );
            }
          );
        }, */
      )
    );
  }
}