import 'package:flutter/material.dart';
import '../classes/media.dart';
import 'detail.dart';
import '../fonctions.dart' as fonctions;

class Recherche extends StatelessWidget{
  Recherche({super.key, required this.text, required this.dropdownValue});

  final dynamic text;
  final dynamic dropdownValue;
  late final Future<List<Media>> listeFilm = fonctions.recupMedia(text, dropdownValue);

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
                    if(snapshot.data.isEmpty){
                      return const Text('Aucun résultat à votre recherche');
                    }
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