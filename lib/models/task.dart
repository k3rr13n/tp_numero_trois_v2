import 'package:flutter/material.dart';

class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficuty;
  String description;
  static int nb = 0;

  Task({required this.id,required this.title,required this.tags,required
  this.nbhours,required this.difficuty,required this.description});

  static List<Task> generateTask(int i){
    List<Task> tasks=[];
    for(int n=0;n<i;n++){
      tasks.add(Task(id: n, title: "title $n", tags: ['tag $n','tag${n+1}'], nbhours: n, difficuty: n, description: '$n'));
    }
    return tasks;
  }

  factory Task.newTask(){
    nb++; //attribut static de la classe.
    return Task(id: nb, title: 'title $nb', tags: ['tags $nb'], nbhours: nb, difficuty: nb%5, description: 'description $nb');
  }

  static Task fromJson(Map<String, dynamic> json) {
    final tags = <String>[];
    //final Color clr;

    //clr = Colors.greenAccent;

    if (json['tags'] != null){
      json['tags'].forEach((t){
        tags.add(t);
      });
    }

    return Task(
      id: json['id'],
      title: json['title'],
      tags: tags,
      nbhours: json['nbhours'],
      difficuty: json['difficulty'],
      description: json['description']
    );
  }
}



