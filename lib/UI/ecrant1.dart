import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tp_numero_trois_v2/models/task.dart';
import 'package:tp_numero_trois_v2/models/view_model.dart';

List<int> colorCodes = <int>[600,500,100];
List<String> entries = <String>['A', 'B', 'C'];
int _selectedIndex = 0;

class EcrantUn extends StatelessWidget {
  final List<Task> myTasks = Task.generateTask(5);

  EcrantUn({super.key});

  void _cliqueSurItem() {
    _selectedIndex = _selectedIndex + 1;
  }
  late List<Task> tasks; //= Task.generateTask(50);
  String tags='';

  @override
  Widget build(BuildContext context) {
    tasks = context.watch<TaskViewModel>().liste;
    return ListView.builder(
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        child: ListTile(
          onTap: _cliqueSurItem,
          title: Text(entries[index]),
          leading: Text(entries[index]),
          subtitle: Text(_selectedIndex.toString()),
          tileColor: Colors.blueGrey,
        ),
      );
    }
  );
}
}

/*return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: myTasks.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.blue,
          elevation: 7,
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(backgroundColor: Colors.blueGrey, child: Text(myTasks[index].id.toString())),
            title: Text(myTasks[index].title),
            subtitle: Text(myTasks[index].tags.join(" ")),
            trailing: IconButton(
              icon: const Icon (Icons.edit),
              onPressed: (){

              },
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );*/

