import 'package:flutter/material.dart';
import 'package:tp_numero_trois_v2/models/task.dart';
import 'package:tp_numero_trois_v2/api/myapi.dart';

List<int> colorCodes = <int>[600,500,100];
List<String> entries = <String>['A', 'B', 'C'];
int _selectedIndex = 0;

class EcrantDeux extends StatelessWidget {

  final MyAPI myAPI = MyAPI();

  late final myTasks = myAPI.getTasks();
  //final List<Task> myTasks = Task.generateTask(5);

  EcrantDeux({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: myTasks,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done &&
              !snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.data != null) {
            return ListView.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (BuildContext context, index) {
                return Card(
                  color: Colors.lightGreen,
                  elevation: 7,
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: CircleAvatar(backgroundColor: Colors.blueGrey,
                        child: Text(snapshot.data?[index].id.toString() ?? '')),
                    title: Text(snapshot.data?[index].title ?? ''),
                    subtitle: Text(snapshot.data?[index].tags.join(" ") ?? ''),
                    trailing: IconButton(
                      icon: const Icon (Icons.edit),
                      onPressed: () {

                      },
                    ),
                  ),
                );
              },
            );
          }
          return Container();
        }
    );
  }
}









/*
class EcrantDeux extends StatefulWidget {
  const EcrantDeux({super.key});

  @override
  State<EcrantDeux> createState() => _EcrantDeux();
}

class _EcrantDeux extends State<EcrantDeux> {
  final ScrollController _homeController = ScrollController();
  static const TextStyle optionStyle = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black);

  final List<Task> lesTaches = Task.generateTask(50);

  /*
  Widget _listViewBody() {
    lesTaches = context.watch<TaskViewModel>().liste;
    return ListView.separated(
      controller: _homeController,
      itemBuilder: (BuildContext context, int index) {
        return Card(
            color: Colors.white,
            elevation: 7,
            margin: const EdgeInsets.all(10),
            child: ListTile (
              leading: CircleAvatar(backgroundColor: Colors.lightBlue, child:Text(myTasks[index].id.toString()),),
              title: Text(myTasks[index].title),
              subtitle: Text(myTasks[index].tag.join(" ")),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: (),
              ),
            )
        )
        return Center(child: Text('Item $index', style: optionStyle));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1),
      itemCount: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body:
      _listViewBody(),
      /*     Center(
          child:
          Text('Indicator', style: optionStyle)
      )*/
    );
  }
} */

  Widget _listViewBody() {
    return ListView.separated(
      controller: _homeController,
      itemBuilder: (BuildContext context, int index) {
        return Center(child: Text('Item $index', style: optionStyle));
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(thickness: 1),
      itemCount: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.limeAccent,
      body:
      _listViewBody(),
      /*     Center(
          child:
          Text('Indicator', style: optionStyle)
      )*/
    );
  }
}

*/