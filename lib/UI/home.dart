import 'package:flutter/material.dart';
import 'package:tp_numero_trois_v2/UI/ecrant1.dart';
import 'package:tp_numero_trois_v2/UI/ecrant2.dart';
import 'package:tp_numero_trois_v2/UI/ecrant3.dart';
import 'package:tp_numero_trois_v2/UI/ecran_settings.dart';
import 'package:tp_numero_trois_v2/models/add_task.dart';

// Class qui gere l'application
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _cliqueSurItem(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> pages = <Widget>[
    EcrantUn(),
    EcrantDeux(),
    EcrantTrois(),
    EcranSettings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _selectedIndex==0?FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => AddTask(),
          )
          );
        },
      child: const Icon(Icons.add),):const SizedBox.shrink(),
      appBar: AppBar(
        //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:
      pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _cliqueSurItem,
        currentIndex: _selectedIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'Ecrant1'),
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'Ecrant2'),
          BottomNavigationBarItem(icon: Icon(Icons.view_list), label: 'Ecrant3'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      )
    );
  }
}