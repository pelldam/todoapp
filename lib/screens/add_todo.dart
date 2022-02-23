import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/repository/todo_repository.dart';
import 'package:todoapp/screens/widget/custom_file.dart';
import 'package:todoapp/utills/colors.dart';

class AddTodo extends StatefulWidget{
Todo? item;
AddTodo({this.item});
_AddTodoState createState()=> _AddTodoState();
}
class _AddTodoState extends State<AddTodo>{
final _titleController=TextEditingController();
final _descriptionController=TextEditingController();
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  if(widget.item!=null){

    _titleController.text=widget.item!.title!;
    _descriptionController.text=widget.item!.description!;
  }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
   appBar: AppBar(
     backgroundColor: appBg,
     actions: [
(widget.item!=null)?GestureDetector(
onTap: ()async{

   if (await confirm(
              context,
              title: const Text('Confirmation!'),
              content: const Text('Would you like to delete task'),
              textOK: const Text('Yes'),
              textCancel: const Text('No'),
            )) {
           await  context.read<TodoRepository>().deleteTask(widget.item!.id!,context:context);
            //  Navigator.pop(context); 
            }else{
          //  Navigator.pop(context);
            }
          },

  child:   Container(
    margin: EdgeInsets.only(right: 10),
    child: Icon(Icons.delete,color: Colors.white,)),
):Container()

     ],
     title:const Text("Create Task",style: TextStyle(color: Colors.white),),),
     body: Container(

       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       margin: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
       child: Column(

         children: [
        Container(
          height: 100,
          child:CustomTextField(label: "Title", hint: "What do you want to do",textEditingController: _titleController,)),
       const SizedBox(height: 20,), 
       CustomTextField(
          height: 200,
          label: "Description",hint: "Describe your task",textEditingController: _descriptionController,),

        SizedBox(height: 20,), 
         Container(
           width: MediaQuery.of(context).size.width,
           height: 50,
           child: TextButton(onPressed: (){
            final value=context.read<TodoRepository>();
            if(value.addingStatus!=TodoAddingStatus.Loading){
              if(widget.item==null)
               value.addTask(_titleController.text, _descriptionController.text,context:context);
               else
                value.editTask(_titleController.text, _descriptionController.text,widget.item!.id,context:context);
            }

           }, child: Consumer<TodoRepository>(
         
             builder: (context, value,_) {
               if(value.addingStatus==TodoAddingStatus.Loading){
                 return CircularProgressIndicator(color: Colors.white,);

               }else{
               return Text("Save",style: TextStyle(color: Colors.white),);
               }
             }
           )),
decoration: BoxDecoration(
  color: appBg,
  borderRadius: BorderRadius.all(Radius.circular(15))
),
         )
         


         ],
       ),
     ),

    );
  }

 
}