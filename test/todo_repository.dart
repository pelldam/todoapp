

import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/repository/todo_repository.dart';

class MockAPI extends TodoRepository {

  List<Todo> _allTodo=[];
   var items =[
      Todo(id: "r1", title: "Working Today", description: "Doing today work", 
          developerId: "pelldam2341",isCompleted: false),
       Todo(id: "r2", title: "Sleeping ", description: "Sleeping Today", 
          developerId: "pelldam2341",isCompleted: true),
    ];
@override
  List<Todo> get allTodo=>_allTodo;

@override
Future getTask()async {
 

_allTodo=items;
  }
@override
  Future addTask(String? title,String? description,{BuildContext? context,String? id})async{
_allTodo.addAll(items);
_allTodo.add(  Todo(id: id, title: title, description: description, 
          developerId: "pelldam2341",isCompleted: false));

  }
  @override
  Future editTask(String? title,String? description,String? id,{BuildContext? context})async{

// _allTodo.addAll(items);
    Todo? item=_allTodo.singleWhere((element) => element.id!.contains(id!));
    if(item!=null){
    _allTodo.remove(item);
    item.title=title;
    item.description=description;
    _allTodo.add(item);
    }
  }
@override
  Future editTaskStatus(String id,bool val)async{
 
  var item=_allTodo.singleWhere((element) => element.id==id);
    _allTodo.remove(item);
    item.isCompleted=val;
    _allTodo.add(item);
  }

@override
Future deleteTask(String id,{BuildContext? context})async{
// _allTodo.addAll(iterable)
  var item=_allTodo.singleWhere((element) => element.id==id);
    _allTodo.remove(item);
}

}