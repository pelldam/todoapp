// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.



import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:todoapp/main.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/query_mutable.dart';
import 'package:todoapp/repository/todo_repository.dart';
import 'package:todoapp/screens/add_todo.dart';
import 'package:todoapp/screens/homepage.dart';
import 'package:todoapp/screens/widget/custom_file.dart';
import 'package:todoapp/screens/widget/todo_item.dart';

import 'todo_repository.dart';

void main() {
  // setupDependencyAssembler();
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyApp());
  
   
  });

  testWidgets("HomePage Test", (WidgetTester tester)async{
      Widget wrapWithController<T>(TodoRepository controller, Widget child) {
  return ChangeNotifierProvider<TodoRepository>(create: (_) => controller, child: child);
}
    Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: HomePage())
);




await tester.pumpWidget(wrapWithController(
  TodoRepository(),
testWidget),
);
//  var  value=Provider.of<TodoRepository>(context, listen: false);
//     value.getTask();

  });
  
  testWidgets("Custom TextField", (WidgetTester tester)async{

    Widget testWidget2 = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: Scaffold(body: CustomTextField (label: "Name",hint: "Ade",)))
);
await tester.pumpWidget(testWidget2);


  });
  group('Get Task', () {
  test('Gettting Available Task', () async {
  //  var value=MockAPI();
    TodoRepository value=TodoRepository();
 value.ismock=true;
    // 1
    await value.getTask();
    // 2
    expect(value.allTodo.length, 2);
    // 3
    expect(value.allTodo[0].title, "Working Today");
     expect(value.allTodo[0].id, "r1");
      expect(value.allTodo[0].description, "Doing today work");
           expect(value.allTodo[0].isCompleted, false);


    expect(value.allTodo[1].title, "Sleeping ");
     expect(value.allTodo[1].id, "r2");
      expect(value.allTodo[1].description, "Sleeping Today");
           expect(value.allTodo[1].isCompleted, true);
  });
  });

   group('Get Add Task,Edit Task, Delete Task ', () {
  test('Add Task', () async {
  //  var value=MockAPI();
    // 1
//  var value1=Provider.of<TodoRepository>(context, listen: false);
 TodoRepository value=TodoRepository();
 value.ismock=true;
//  value2.addingStatus==TodoAddingStatus.Loading;

//  expect(value.addingStatus, TodoAddingStatus.Empty);
    await value.addTask("New Task", "My task",id: "r3");
    // await value.getTask();
    // 2
    expect(value.allTodo.length, 3);
    // 3
    expect(value.allTodo[0].title, "Working Today");
     expect(value.allTodo[0].id, "r1");
      expect(value.allTodo[0].description, "Doing today work");
           expect(value.allTodo[0].isCompleted, false);


    expect(value.allTodo[1].title, "Sleeping ");
     expect(value.allTodo[1].id, "r2");
      expect(value.allTodo[1].description, "Sleeping Today");
           expect(value.allTodo[1].isCompleted, true);
            expect(value.allTodo[2].title, "New Task");
     expect(value.allTodo[2].id, "r3");
      expect(value.allTodo[2].description, "My task");
      
           expect(value.allTodo[2].isCompleted, false);
  });

 test('Edit Task', () async {
   TodoRepository value=TodoRepository();
 value.ismock=true;
    // 1
  await value.addTask("New Task", "My task",id: "r3");
   await value.editTask("New Tasks", "My taskss","r3");
    // await value.getTask();
    // 2
    expect(value.allTodo.length, 3);
    // 3
    expect(value.allTodo[0].title, "Working Today");
     expect(value.allTodo[0].id, "r1");
      expect(value.allTodo[0].description, "Doing today work");
           expect(value.allTodo[0].isCompleted, false);


    expect(value.allTodo[1].title, "Sleeping ");
     expect(value.allTodo[1].id, "r2");
      expect(value.allTodo[1].description, "Sleeping Today");
           expect(value.allTodo[1].isCompleted, true);
            expect(value.allTodo[2].title, "New Tasks");
     expect(value.allTodo[2].id, "r3");
      expect(value.allTodo[2].description, "My taskss");
      
           expect(value.allTodo[2].isCompleted, false);
  });


 test('Delete Task', () async {
    TodoRepository value=TodoRepository();
 value.ismock=true;
    // 1
  await value.addTask("New Task", "My task",id: "r3");
    value.deleteTask("r3");
    await value.getTask();
    // 2
    expect(value.allTodo.length, 2);
    // 3
    expect(value.allTodo[0].title, "Working Today");
     expect(value.allTodo[0].id, "r1");
      expect(value.allTodo[0].description, "Doing today work");
           expect(value.allTodo[0].isCompleted, false);


    expect(value.allTodo[1].title, "Sleeping ");
     expect(value.allTodo[1].id, "r2");
      expect(value.allTodo[1].description, "Sleeping Today");
           expect(value.allTodo[1].isCompleted, true);

            
       
  });



 test('Edit  Task Status', () async {
    TodoRepository value=TodoRepository();
 value.ismock=true;
    // 1
  await value.addTask("New Task", "My task",id: "r3");
    value.editTaskStatus("r3", true);
    await value.getTask();
    // 2
    expect(value.allTodo.length, 2);
    expect(value.addingStatus, TodoAddingStatus.Empty);
    // 3
   
 });
  });
  testWidgets("Add Task", (WidgetTester tester)async{


      Widget wrapWithController<T>(TodoRepository controller, Widget child) {
  return ChangeNotifierProvider<TodoRepository>(create: (_) => controller, child: child);
}
    Widget testWidget = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: AddTodo())
);
await tester.pumpWidget(wrapWithController(
  TodoRepository(),
testWidget),
);
var value=MockAPI();
    // 1
    await value.getTask();
    Widget testWidget1= new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: AddTodo(item:value.allTodo[0] ,))
);
await tester.pumpWidget(wrapWithController(
  TodoRepository(),
testWidget1),
);
  
  });
 

test("Add Task Mutation ", ()async{
QueryMutation queryMutation = QueryMutation();
String addTaskMutation=queryMutation.addTodo();
expect(addTaskMutation,r''' 

mutation InsertTask($description: String!, $developer_id: String!, $title: String!) {
  insert_tasks_one(object: {title: $title, developer_id: $developer_id, description: $description}) {
    created_at
    description
    developer_id
    id
    isCompleted
    title
    updated_at
  }
}


''');
});


test("Get All Task Mutation ", ()async{
QueryMutation queryMutation = QueryMutation();
String getTaskMutation=queryMutation.getAllList();
expect(getTaskMutation, r'''
query GetAllTasks($developer_id: String!) {
  tasks(where: {developer_id: {_eq: $developer_id}}) {
    id
    developer_id
    description
    created_at
    isCompleted
    title
    updated_at
  }
}
''');
});

test("Edit Task Mutation ", ()async{
QueryMutation queryMutation = QueryMutation();
String getTaskMutation=queryMutation.editTodo();
expect(getTaskMutation, r'''
mutation UpdateTask($payload: tasks_set_input = {}, $id: uuid!) {
  update_tasks_by_pk(pk_columns: {id: $id}, _set: $payload) {
    created_at
    description
    developer_id
    id
    isCompleted
    title
    updated_at
  }
}

 ''');
});


test("Delete Task Mutation ", ()async{
QueryMutation queryMutation = QueryMutation();
String Mutation=queryMutation.deleteTodo();
expect(Mutation, r'''
mutation DeleteTask($id: uuid = "") {
  delete_tasks_by_pk(id: $id) {
    id
    developer_id
    description
    created_at
    isCompleted
    title
    updated_at
  }
}




 ''');
});

test(" Get Single Task Mutation ", ()async{
QueryMutation queryMutation = QueryMutation();
String Mutation=queryMutation.getSingleTask();
expect(Mutation, r'''
query GetSingleTask($id: uuid!) {
  tasks_by_pk(id: $id) {
    created_at
    description
    developer_id
    id
    isCompleted
    title
    updated_at
  }
}


 ''');
});

testWidgets("Test  Item  ", (WidgetTester tester)async{

var value=MockAPI();
    // 1
    await value.getTask();
     Widget testWidget2 = new MediaQuery(
      data: new MediaQueryData(),
      child: new MaterialApp(home: Scaffold(body: TodoItem(item: value.allTodo[0], index: 0)))
);
await tester.pumpWidget(testWidget2);

});
test("Todo Model", ()async{

var json={
"id": "424ab3bf-6565-43d5-abf3-1ab3e118fe89",
        "developer_id": "peldam13223",
        "description": "My Woirks",
        "created_at": "2022-02-22T00:34:52.597508+00:00",
        "isCompleted": false,
        "title": "New Work by Ay",
        "updated_at": "2022-02-22T00:34:52.597508+00:00"

};
var result=Todo.fromJson(json);
expect(result.id, "424ab3bf-6565-43d5-abf3-1ab3e118fe89");
expect(result.developerId, "peldam13223");
expect(result.description, "My Woirks");
// expect(result.createdAt.toString(),"2022-02-22T00:34:52.597508+00:00" );
expect(result.title, "New Work by Ay");
// expect(result.updateAt!.toString(), "2022-02-22T00:34:52.597508+00:00");
});
}


