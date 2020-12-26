import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/dp_helper.dart';

import 'package:todo_app/task_model.dart';

// ignore: must_be_immutable
class TaskWidget extends StatefulWidget{
 Task task;
 Function function;
 TaskWidget(this.task,[this.function]);

  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
 void delete(Task task) async {
   await DBHelper.dbHelper.deleteTask(task);
   

 }


  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child:Padding(
       padding: EdgeInsets.symmetric(horizontal: 10) ,

      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  size: 20.0,
                  color: Colors.black,
                ),
                onPressed: (){
                
                }, 
                alignment: Alignment.centerLeft,
              ),
        Text(widget.task.taskName),
        Checkbox(value: widget.task.isComplete, onChanged: (value){
          this.widget.task.isComplete = !this.widget.task.isComplete;
          
          setState(() {
            widget.function();
          });
        }
        )
      ],
      )
    ),
    );
    
  }
}