import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/src/provider.dart';
import 'package:todoapp/repository/todo_repository.dart';
// import 'package:provider/src/provider.dart';
import 'package:todoapp/screens/add_todo.dart';
import 'package:todoapp/screens/widget/todo_item.dart';
import 'package:todoapp/utills/colors.dart';

class HomePage extends StatefulWidget{


_HomePageState createState()=>_HomePageState();
}

class _HomePageState extends State<HomePage>{
  var value;
@override
  void initState() {
    // TODO: implement initState

    super.initState();

  
  }
  
void didChangeDependencies() {
  value=Provider.of<TodoRepository>(context, listen: false);
    value.getTask();
super.didChangeDependencies();
}


  @override
  Widget build(BuildContext context) {

  

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBg,
        title: const Text("Todo List",style: TextStyle(color: Colors.white),),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: appBg,
        onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodo()));
      },child: 
      Icon(Icons.add,
      ) ,),
    body:Container(
width: MediaQuery.of(context).size.width,
height: MediaQuery.of(context).size.height,
child:
Consumer<TodoRepository>(
  
  builder: (context, value,_) {
    return     (value.status==TodoListState.Loading)?Center(
    
      child: CircularProgressIndicator(
        color: appBg,
      ),
    ):
    (value.status==TodoListState.Available)?
    ListView.builder(
      itemCount: value.allTodo.length,
      itemBuilder: (context,index){
    var item=value.allTodo[index];
      return TodoItem(item: item, index: index);
    }):
     Center(
    
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
       children:const [
    
     const Text("Todo List  is empty",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: 24),),
    
    const Text("Create a Todo",style: TextStyle(color:Color(0xFF777777),fontSize: 18 ),)
       ],
    
    
      ),
    );
  }
),

    ) ,

    );
  }
}