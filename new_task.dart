

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/dp_helper.dart';
import 'package:todo_app/task_model.dart';

class NewTasks extends StatefulWidget {
   Task task;
  final String taskName;
  final bool isComplete;
  NewTasks(this.taskName,this.isComplete);
  @override
  State<StatefulWidget> createState() {
 return _NewTasksState(this.taskName,this.isComplete);
  }
  
}

class _NewTasksState extends State<NewTasks> {


  bool isComplete = false ;
   String taskName;
   Task task;

   _NewTasksState(this.taskName,this.isComplete);
  bool marked = false;


  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: new GestureDetector(
      child: Icon(Icons.close, size: 30),
      onTap:(){
      Navigator.pop(context);
      DBHelper.dbHelper.updateTask(task);
     
      },
       ) ,
       title:Text('New Task',style: TextStyle(fontSize:26),),
       
     ),
   body:Container(
     padding: EdgeInsets.all(20),
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
     TextField(
       
       decoration: InputDecoration(
         labelText: "Task: ",
         hintText: "E.g. Cleaning home",
         labelStyle:TextStyle(
           fontSize: 20, fontFamily: "Lato",color: Colors.purpleAccent,fontWeight: FontWeight.bold),
           hintStyle: TextStyle(fontSize: 18,fontFamily: "Lato",color: Colors.grey),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(10)
         ),
       ),
     onChanged: (value){
       this.taskName = value;
     },

     ), 
     Checkbox(value: isComplete, onChanged: (value){
      DBHelper.dbHelper.updateTask(task);
     },
     ),
     RaisedButton( 
       child: Text('Add new Task' , 
       style:TextStyle(color:Colors.orange,fontFamily: "Lato"),),
       color: Colors.tealAccent,
       onPressed: (){
     setState(() {
       save();
               DBHelper.dbHelper.insertNewTask(task);
               DBHelper.dbHelper.updateTask(task);
       
                   });
                     }
                     ),
                 
                   
                 ],
                 
                 ),
                 ) ,
                 
                 );
                
                }
              }
       
       void save() async {
     int result;
     if(isEditable()){
       if(marked){
         
       }
     }
}
 