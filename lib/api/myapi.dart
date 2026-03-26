import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tp_numero_trois_v2/models/task.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/todo.dart';

class MyAPI{
  Future<List<Task>> getTasks() async{
    await Future.delayed(Duration(seconds: 1));
    final dataString = await _loadAsset('data/tasks.json');
    final Map<String,dynamic> json = jsonDecode(dataString);
    if (json['tasks']!=null){
      final tasks = <Task>[];
      json['tasks'].forEach((element){
        tasks.add(Task.fromJson(element));
      });
      return tasks;
    }else{
      return [];
    }
  }
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }

  Future<List<Todo>> getTodo() async{
    await Future.delayed(Duration(seconds: 1));
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    if (res.statusCode == 200) {
      final List<dynamic> json = jsonDecode(res.body);
      final todo = <Todo>[];
      for (var element in json) {
        todo.add(Todo.fromJson(element));
      };
      return todo;
    }
    else{
      throw Exception("Feur");
    }
  }
}