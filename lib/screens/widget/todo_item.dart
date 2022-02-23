import 'package:custom_check_box/custom_check_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/repository/todo_repository.dart';
import 'package:todoapp/utills/colors.dart';

import '../add_todo.dart';

class TodoItem extends StatelessWidget{
Todo? item;
int? index;

TodoItem({required this.item,required this.index});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){

        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodo(item: item,)));
      },
      child: Container(
    width: MediaQuery.of(context).size.width,
    height: 70,
    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    child: Row(
    
    children: [
    Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
      color: item!.isCompleted!?color_bg4:color_bg1,
      border: Border.all(color:item!.isCompleted!?color_bg3:color_bg2 ),
      borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: Center(
    
      child: Text(item!.isCompleted!?item!.title![0]:"$index",style: TextStyle(color: item!.isCompleted!?color_bg3:color_bg2),),
      ),
    ),
    SizedBox(width:10),
    Container(
      width: MediaQuery.of(context).size.width*0.5,
    margin: EdgeInsets.only(top: 10,right: 40),
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
    
        Text(item!.title!,style:TextStyle(color:color_text,fontSize: 14 ) ,overflow: TextOverflow.ellipsis,),
        SizedBox(height: 5,),
        Text(item!.description!,style:TextStyle(color:color_text1,fontSize: 12 ) ,overflow: TextOverflow.ellipsis,),
    
      ],
      ),
    
      
    ),
    Expanded(child: SizedBox()),
    CustomCheckBox(
                value: item!.isCompleted!,
                shouldShowBorder: true,
                borderColor: item!.isCompleted!?color_bg3:border_color,
                checkedFillColor: item!.isCompleted!?color_bg3:border_color,
                borderRadius: 8,
                borderWidth: 1,
                checkBoxSize: 22,
                onChanged: (val) {
                  //do your stuff here
                  item!.isCompleted!=val;
                  
               context.read<TodoRepository>().editTaskStatus(item!.id!, val);
              // value.addTask(_titleController.text, _descriptionController.text,context);
                },
              )
    
    
    
    ],
    
    ),
      ),
    );
  }
}

