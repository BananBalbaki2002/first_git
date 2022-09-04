

import 'package:flutter/cupertino.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/my_app/team_leader_view/attachement_service.dart';
import 'package:tasko/my_models/attachement_model.dart';

class AttachementController with ChangeNotifier{
List<AttachementModel> attachement_list=[];
TextEditingController descriptionController=TextEditingController();
TextEditingController titleContoller=TextEditingController();



  Future<List<AttachementModel>> fetchAttachement()async{

 attachement_list  =await  AttachementService.AllAttachement();

return attachement_list;

  }
//_--------------------------ADD Attachement-------------------

  var addedAttachement;
  TaskController taskController=TaskController();
  Future fetchAdedAttachement(int id)async{

    AttachementModel attachementModel=AttachementModel(
        title:titleContoller.text ,
      description: descriptionController.text,
task_id:id
    );

    addedAttachement= await AttachementService.AddAttachement(attachementModel);

    attachement_list.add(addedAttachement);
    notifyListeners();




  }





}