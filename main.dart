import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/dp_helper.dart';
import 'package:todo_app/new_task.dart';
import 'package:todo_app/task_model.dart';
import 'package:todo_app/task_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabBarPage(),
     
    );


  }
}
class TabBarPage extends StatefulWidget{
  @override
  _TabBarPageState createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with SingleTickerProviderStateMixin{
 TabController tabController;
  @override
  void initState(){
    super.initState();
    tabController = TabController(length: 3,vsync: this);
  }
  Widget build(BuildContext context) {
  
    return DefaultTabController(
      length: 3 ,
          child: Scaffold(appBar: AppBar(
       
        title: Text('MyTasks'),
        bottom: TabBar(tabs: [
          Tab(
            text:'All Tasks'
          ),
          Tab(
          text: 'Complete Tasks',
          ),
          Tab(
            text: 'InComplete Tasks',
            ),
        ],
        isScrollable: true,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child:TabBarView(
        controller: tabController,
        children:[
          AllTasks(),
          CompleteTasks(),
          InCompleteTasks()]
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: "Add Task",
       child: Icon(Icons.add),
      focusColor: Colors.blueAccent,
      onPressed: () {
        Navigator.push(context, 
    MaterialPageRoute(builder: (context) => NewTasks("",false)),
    );

   
         }
         ),
         ),
       );    
     }
   }
   
 
  
class AllTasks extends StatefulWidget{
  @override
  _AllTasksState createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  myFun(){
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
       Column(
         children: 
          tasks.map((e) => TaskWidget(e,myFun())).toList()),
         

      );
    
  }
}
class CompleteTasks extends StatefulWidget{
  @override
  _CompleteTasksState createState() => _CompleteTasksState();
}

class _CompleteTasksState extends State<CompleteTasks> {
  myFun(){
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
 
    return Container(
      child:
       Column(
         children: 
          tasks.where((element) => element.isComplete==true).map((e) => TaskWidget(e)).toList()),
         

      );
  }
}
class InCompleteTasks extends StatefulWidget{
 
  @override
  _InCompleteTasksState createState() => _InCompleteTasksState();
}

class _InCompleteTasksState extends State<InCompleteTasks> {
  @override
  Widget build(BuildContext context) {
    
 return Container(
      child:
       Column(
         children: 
          tasks.where((element) => element.isComplete==false).map((e) => TaskWidget(e)).toList()),
         

      );
  }
}