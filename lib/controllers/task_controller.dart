


import 'package:flutter/material.dart';
import 'package:tasko/my_models/model_task_subtask.dart';
import 'package:tasko/my_models/task_model.dart';
import 'package:tasko/services/task_service.dart';
import 'package:tasko/services/user_service.dart';

class TaskController with ChangeNotifier{

static var model;
  List<Task> list_of_tasks=[];

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  int selectedIdStatus=1;
  int selectedIdTeam=1;
  DateTime selectedStartDate=DateTime.now();
  DateTime selectedEndDate=DateTime.now();
  int  id_task=0;
var addedTask;
var editedTask;

//--------------AddTask-------------------------------------
Future  onClickAddTask()async{

  Task taskModel=Task(title:titleController.text ,description:descriptionController.text ,
      start_date:selectedStartDate.toString() ,end_date:selectedEndDate.toString() ,status_id:selectedIdStatus.toString() ,team_id:selectedIdTeam.toString() );

    addedTask=await TaskService.addTask(taskModel);
  list_of_tasks.add(addedTask);
  notifyListeners();




  }
//--------------EditTask-------------------------------------
Future onClickEditTask()async{

  Task taskModel=Task(title:titleController.text ,description:descriptionController.text ,
      start_date:selectedStartDate.toString()
      ,end_date:selectedEndDate.toString() ,status_id:selectedIdStatus.toString()
      ,team_id:selectedIdTeam.toString() );


  editedTask=await TaskService.editTask(taskModel,id_task);
  for(var us in list_of_tasks){
    if(us.id == id_task){
      us=editedTask;
      notifyListeners();
      break;
    }
  }
}
var message;
//-------------------------------
  onClickDeleteTask() async {

    print(id_task);

    message=await await TaskService.deleteTask(id_task);

    //int index,int id
    for (var us in list_of_tasks) {
      if (us.id == id_task) {
        list_of_tasks.remove(us);
        notifyListeners();
        break;
      }
    }



  }


//--------------ShowAllTask-------------------------------------

Future<List<Task>> onClickshowTasks()async{

  list_of_tasks=await  TaskService. servAllTasks();

  return list_of_tasks;
}

//--------------ShowOneTask-------------------------------------

  static Future<Model_Task_SubTask>  onClickshowOneTask()async{

  model=await  TaskService.servOneTask();
  return model;
}
//----------------showCompletedTasks-----------
  Future<List<Task>> onClickshowCompletedTasks()async{

    return  await TaskService. servCompletedTasks();
  }

  //-----------------MissedTasks------------------
  Future<List<Task>> onClickshowMissedTasks()async{

    return  await TaskService. servMissedTasks();
  }

  //-----------------OnProgressTasks------------------
  Future<List<Task>> onClickshowOnProgressTasks()async{

    return  await TaskService. servOnprogressTasks();
  }

  //-------------------

  Map<String,Future<List< Task >>> menu = {
    "All":TaskService. servAllTasks(),
    "Completed":TaskService.servCompletedTasks(),
    "Missed":TaskService. servMissedTasks(),
    "Progress":TaskService. servOnprogressTasks()

  };




}