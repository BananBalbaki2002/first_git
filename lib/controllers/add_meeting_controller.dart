




import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:tasko/my_models/meeting_model.dart';
import 'package:tasko/my_models/user_model.dart';
import 'package:tasko/services/meeting_service.dart';
import 'package:tasko/services/user_service.dart';

class AddMeetingProvider extends ChangeNotifier
{

  List<User> list_of_Users = [];
  MeetingModel? modelMeeting;
  var statesMap;
  var stateId;
  var stateeee;
  var message;
  String? dateOfMeetingg;
  static List<String> st=[];

  TextEditingController dateOfMeeting=TextEditingController();
  //TextEditingController meetingTeam=TextEditingController();
  String? timeOfMeeting;
  var meetingStatus;
  List<User?> meetingWith=[];
  List<int> l=[];
  Map<String,String> map={};
  changeDOM(var dodo)
  {
    dateOfMeetingg=dodo;
    notifyListeners();

  }
  printDOM()
  {
    return dateOfMeetingg;
  }
  changeTOM(var dodo)
  {
    timeOfMeeting=dodo;
    notifyListeners();

  }
  printTOM()
  {
    return timeOfMeeting;
  }
  Future onAddMeeting()async{

    MeetingModel meetingModel =MeetingModel(
        meeting_date: dateOfMeetingg ,
        start_at: timeOfMeeting ,

        participant_list: l
    );
    for(int i=0;i<l.length;i++)
    {
      map["participant_list[$i]"]=l.toString();
    }
    message =await   MeetingService.addMeeting(meetingModel);

  }

  Future<List<User>> onClickShowAllUser() async {

    list_of_Users = await UserService.servAllUsaer();

    return list_of_Users;

  }
  savingSelectedItems(HashSet<User> selectedItem){

    if(selectedItem.length!=0)
    {
      selectedItem.forEach((element) {l.add(element.id);});
      notifyListeners();
    }
    notifyListeners();
  }





}