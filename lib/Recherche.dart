import 'package:flutter/material.dart';
import 'Film.dart';
import 'Detail.dart';

class Recherche extends StatelessWidget{
  const Recherche({super.key, required this.listeFilm});

  final Future<List<Film>> listeFilm;

  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recherche'),
        ),
        body: Center(
            child: FutureBuilder(
                future: listeFilm,
                builder: (context, AsyncSnapshot snapshot){
                  if(snapshot.hasData) {
                    return ListView.separated(
                      separatorBuilder: (context, index) =>
                          const Divider(color: Colors.cyan),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                            title: Text(
                              '${(snapshot.data as dynamic)[index].title}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.cyan,
                                  fontSize: 20),
                            ),
                            subtitle: Text(
                              '${(snapshot.data as dynamic)[index].annee}',
                              textAlign: TextAlign.center,
                            ),
                            leading: (snapshot.data as dynamic)[index].urlImage != "N/A"? Image.network(
                              (snapshot.data as dynamic)[index].urlImage,
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ): Image.asset(
                              'assets/images/non_images.png',
                              fit: BoxFit.cover,
                              width: 50,
                              height: 50,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (
                                    context) => Detail(imdbID: '${(snapshot.data as dynamic)[index].imdbID}')
                                ),
                              );
                            }
                        );
                      },
                    );
                  }
                  else if(snapshot.hasError){
                    return Text('${snapshot.error}');
                  }

                  return const CircularProgressIndicator();
                }
            )
        )
    );
  }
}