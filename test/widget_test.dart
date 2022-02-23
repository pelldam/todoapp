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
import 'package:todoapp/repository/todo_repository.dart';
import 'package:todoapp/screens/add_todo.dart';
import 'package:todoapp/screens/homepage.dart';
import 'package:todoapp/screens/widget/custom_file.dart';

import 'todo_repository.dart';

void main() {
  // setupDependencyAssembler();
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( MyApp());
  
    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
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
  
  group('Get Task', () {
  test('Gettting Available Task', () async {
   var value=MockAPI();
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
   var value=MockAPI();
    // 1

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
   var value=MockAPI();
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
   var value=MockAPI();
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

  
  });
 


}


