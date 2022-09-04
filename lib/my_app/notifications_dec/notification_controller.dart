

import 'package:flutter/cupertino.dart';
import 'package:tasko/my_app/notifications_dec/data_model.dart';
import 'package:tasko/my_app/notifications_dec/notification_model.dart';

import 'notification_service.dart';

class NotificationController with ChangeNotifier{


  List<LDataModel> l_title=[];


List<NotificationModel> l_Notifi=[];


String? id_notification;
bool isReaded=false;


  toReaded(String id,int index){
    isReaded=true;
l_Notifi[index].readed=true;
    id_notification=id;

   notifyListeners();
  }


  Future<List<NotificationModel>>  cll()async{

    l_Notifi=await NotificationService.ll();
    l_title= await NotificationService.n_title;
    //print(l_Notifi[0].data!.title);

    return  l_Notifi;

  }


  List<NotificationModel> l_R_Notifi=[];
Future <List<NotificationModel>> ReadedNotification()async{
    l_R_Notifi=await  NotificationService.LResdedNotifications();
    l_title=await NotificationService.n_title;



    return l_R_Notifi;

  }

var message;
Future <String> CmakeReaded(String id)async{

    message=await NotificationService.makeNotificationsRed(id);



    return message;
}



}