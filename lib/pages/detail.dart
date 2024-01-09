import 'package:flutter/material.dart';
import '../classes/detail_media.dart';
import '../classes/episode.dart';
import '../fonctions.dart' as fonctions;

class Detail extends StatelessWidget{
  Detail({super.key, required this.imdbID});

  final dynamic imdbID;
  late final Future<DetailMedia> filmDetail = fonctions.recupDetailMedia(imdbID);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body: Center(
        child: FutureBuilder(
          future: filmDetail,
          builder: (context, AsyncSnapshot snapshot){
            if(snapshot.hasData){
              return ListView(
                children: <Widget>[
                  Container(
                    padding: (
                        const EdgeInsets.only(left: 20, top: 20)
                    ),
                  ),
                  Text("${(snapshot.data).title}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan, fontSize: 40.0)),
                  Text("${(snapshot.data).released}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  Text("${(snapshot.data).genre}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  (snapshot.data).urlImage != "N/A"? Image.network("${(snapshot.data).urlImage}", width: 300, height: 300) : Image.asset('assets/images/non_images.png', width: 300, height: 300),
                  Text("Type de média : ${(snapshot.data).type}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  Text("${(snapshot.data).plot}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  Text("Notation : ${(snapshot.data).rated}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  Text("Durée : ${(snapshot.data).runtime}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  Text("Directeur : ${(snapshot.data).director}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  Text("Écriture : ${(snapshot.data).writer}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  Text("Acteurs : ${(snapshot.data).actors}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  Text("Note métacritic sur 100 : ${(snapshot.data).metascore}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)),
                  (snapshot.data).dvd != null && (snapshot.data).type != 'game' ? Text("DVD : " "${(snapshot.data).dvd}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan)) : const Text(""),


                  (snapshot.data).type == 'series' && (snapshot.data).episodes != null ?
                    Column(
                      children: [
                        for (int i = 0; i<(snapshot.data).episodes.length; i++)
                        Column(
                          children: [
                            Text("Saison ${i + 1}", textAlign: TextAlign.center, style: const TextStyle(color: Colors.cyan, fontSize: 30.0)),
                            for (Episode j in (snapshot.data).episodes[i])
                            ListTile(
                              title: Text("${j.title}"),
                              subtitle: Text("Episode : ${j.episode} - Sorti le ${j.released}"),
                            )
                          ],
                        )
                      ],
                    )
                  : const Text("")
                ]
              );
            }
            else if(snapshot.hasError){
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }
        )
      ),
    );
  }
}