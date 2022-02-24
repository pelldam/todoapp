import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/query_mutable.dart';
import 'package:todoapp/repository/grapql_provider.dart';
enum TodoListState {Loading,Empty,Available,Error,NoTodoList}
enum TodoAddingStatus{Loading,Success,Error,Empty}
class TodoRepository extends ChangeNotifier{

List<Todo> _allTodo=[];
List<Todo> get allTodo=>_allTodo;

String developer_id="peldam13223";
// GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

QueryMutation queryMutation = QueryMutation();
TodoListState status=TodoListState.Empty;
bool ismock=false;
// GraphQLClient _client = await clientToQuery();
TodoAddingStatus addingStatus=TodoAddingStatus.Empty;
 var items =[
      Todo(id: "r1", title: "Working Today", description: "Doing today work", 
          developerId: "pelldam2341",isCompleted: false),
       Todo(id: "r2", title: "Sleeping ", description: "Sleeping Today", 
          developerId: "pelldam2341",isCompleted: true),
    ];
Future getTask()async{

  if(ismock){

_allTodo=items;
return;
  }
  GraphQLClient _client = await clientToQuery();
  status=TodoListState.Loading;
  // notifyListeners();
QueryResult result = await _client.query(

QueryOptions(

document:gql(queryMutation.getAllList()),
variables: {
  "developer_id":"peldam13223"
}
),


);

if(result.data==null){

status=TodoListState.NoTodoList;
notifyListeners();



}else{


status=TodoListState.Available;

List<Todo> _list=List.from(result.data!['tasks']).map((e) => Todo.fromJson(e)).toList();
_list.sort( (a,b){ if(b.isCompleted!) {
    return -1;
  }
  return 1;
});
_allTodo=_list;
notifyListeners();


}

print("mutation query result ${result.data}");

}

Future addTask(String? title,String? description,{BuildContext? context,String? id})async{
 if(ismock){

   _allTodo.addAll(items);
_allTodo.add(  Todo(id: id, title: title, description: description, 
          developerId: "pelldam2341",isCompleted: false));
return;
 }
 
  GraphQLClient _client = await clientToQuery();
addingStatus=TodoAddingStatus.Loading;
notifyListeners();
final result=await _client.mutate(MutationOptions(
  variables: {

     "developer_id": "peldam13223",
 "title":title,
 "description": description
  },
  document:gql(queryMutation.addTodo(

// title: title,
// description: description


)) ));

print("add task result ${result.data}");
if(result.data!=null){
getTask();
addingStatus=TodoAddingStatus.Success;
Navigator.pop(context!);

}else{

addingStatus=TodoAddingStatus.Error;

}
}
Future editTask(String? title,String? description,String? id,{BuildContext? context})async{
  if(ismock){

      Todo? item=_allTodo.singleWhere((element) => element.id!.contains(id!));
    if(item!=null){
    _allTodo.remove(item);
    item.title=title;
    item.description=description;
    _allTodo.add(item);
    }
    return;
  }
  
  GraphQLClient _client = await clientToQuery();
addingStatus=TodoAddingStatus.Loading;
notifyListeners();
final result=await _client.mutate(MutationOptions(
  variables: {

  "id":id,
"payload": {"isCompleted": false, "title":title, "description": description}
  },
  document:gql(queryMutation.editTodo(




)) ));


if(result.data!=null){
getTask();
addingStatus=TodoAddingStatus.Success;

Navigator.pop(context!);
}else{

addingStatus=TodoAddingStatus.Error;

}
}



Future editTaskStatus(String id,bool val)async{

  if(ismock){
 var item=_allTodo.singleWhere((element) => element.id==id);
    _allTodo.remove(item);
    item.isCompleted=val;
    _allTodo.add(item);
    return;

  }
  GraphQLClient _client = await clientToQuery();
addingStatus=TodoAddingStatus.Loading;
notifyListeners();
final result=await _client.mutate(MutationOptions(
  variables: {

  "id":id,
"payload": {"isCompleted": val,}
  },
  document:gql(queryMutation.editTodo(




)) ));


if(result.data!=null){
getTask();
addingStatus=TodoAddingStatus.Success;

}else{

addingStatus=TodoAddingStatus.Error;

}
}


Future deleteTask(String id,{BuildContext? context})async{
if(ismock){
 var item=_allTodo.singleWhere((element) => element.id==id);
    _allTodo.remove(item);
  return;
}
 GraphQLClient _client = await clientToQuery();
addingStatus=TodoAddingStatus.Loading;
notifyListeners();
final result=await _client.mutate(MutationOptions(
  variables: {

  "id":id,

  },
  document:gql(queryMutation.deleteTodo(




)) ));


if(result.data!=null){
getTask();
addingStatus=TodoAddingStatus.Success;
Navigator.pop(context!);
}else{

addingStatus=TodoAddingStatus.Error;

}
}
}