import 'package:todo_app/dp_helper.dart';

class Task{
  String taskName;
  bool isComplete;
  Task(this.taskName, this.isComplete);
  toJson(){
    return {
    DBHelper.taskIdColumn : this.taskName,
    DBHelper.taskIsCompleteColumnName : this.isComplete? 1 : 0
    };
  }
}