import 'package:flutter/material.dart';

import 'tabs/rechercher.dart';
import 'tabs/compte.dart';
import 'tabs/parametres.dart';

void main() => runApp(const BraemMedia());

class BraemMedia extends StatelessWidget{
  const BraemMedia({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TabBarMenu()
    );
  }
}

class TabBarMenu extends StatefulWidget{
  const TabBarMenu({super.key});

  @override
  State<TabBarMenu> createState() => _TabBarMenuState();
}

class _TabBarMenuState extends State<TabBarMenu>{
  static const List<Widget> _tabs = <Widget>[
    RechercherPage(),
    ComptePage(),
    ParametresPage()
  ];

  int _selectedIndex = 0;

  void _setCurrentPage(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("BraemMedia")
      ),
      body: _tabs.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _setCurrentPage,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rechercher'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Compte'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Paramètres'
          )
        ]
      ),
    );
  }
}