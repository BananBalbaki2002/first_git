

import 'package:flutter/cupertino.dart';
import 'package:tasko/my_app/sub_task_dec/subtask_service.dart';
import 'package:tasko/my_models/status_model.dart';
import 'package:tasko/my_models/sub_task_model.dart';

class ShowSubtaskController extends ChangeNotifier{


  var priorities;
  var substates;
  var subtaskModel;
  String? message;
  String? memEditmesage;
  Future<ModelSubTask> fetchSubtask(var id) async
  {
    print('yes');
    await fetchStates();
    await fetchPriorites();
    priorities=await SubTaskService.priority;
    substates=await SubTaskService.suStatu;
    subtaskModel=await SubTaskService.showSubtask(id);
    print('hh');
    return subtaskModel;

  }
  Future deletion(int id) async{
    message= await SubTaskService.deleteSubtask(id);
    return message;
  }
  Future<List<StatusModel>> fetchStates() async
  {
    await SubTaskService.subSt();
    substates=await SubTaskService.suStatu;
    print(substates);
    print('kkk');
    return await SubTaskService.subSt();
  }
  Future<List<StatusModel>> fetchPriorites() async
  {
    await SubTaskService.subPr();
    priorities=await SubTaskService.priority;
    return await SubTaskService.subPr();
  }
  Future<String> mEditSubtask(var id) async
  {
    memEditmesage=await SubTaskService.memberEditSubtask(id);
    return await SubTaskService.memberEditSubtask(id);

  }



}