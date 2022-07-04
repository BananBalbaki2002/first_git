


import 'package:tasko/my_models/task_model.dart';
import 'package:tasko/services/task_service.dart';
import 'package:tasko/services/user_service.dart';

class TaskController{




Future  onClickAddTask()async{

    TaskModel taskModel=TaskModel(


    );
    await TaskService.addTask(taskModel);


  }



}