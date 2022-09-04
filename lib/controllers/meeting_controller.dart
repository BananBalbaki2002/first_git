



import 'package:flutter/cupertino.dart';
import 'package:tasko/my_app/notifications_dec/notifications_scre.dart';
import 'package:tasko/my_models/meeting_model.dart';
import 'package:tasko/my_models/meeting_states_model.dart';
import 'package:tasko/my_models/user_model.dart';
import 'package:tasko/services/meeting_service.dart';

class MeetingsController with ChangeNotifier{


  String? message;

  var meetingState;
  var statesMap;
  var meeting;
  List<MeetingModel> meet=[];
  Future<List<MeetingModel>> fetchMeetings() async
  {
    await fetchMeetingStates();
    meet=await MeetingService.showMeetings();
    return await MeetingService.showMeetings();

  }
  //**
  Future<List<MeetingModel>> fetchLeMeetings() async
  {
    await fetchMeetingStates();
    meet=await MeetingService.showLeMeetings();
    return await MeetingService.showLeMeetings();

  }
  Future<List<MeetingStates>> fetchMeetingStates() async
  {
    await MeetingService.meetingStates();
    statesMap=await MeetingService.map;
    return await MeetingService.meetingStates();
  }
  //**
  Future<MeetingModel> fetchMeeting(var id) async
  {
    await fetchMeetingStates();
    statesMap=await MeetingService.map;
    meeting=await MeetingService.showMeeting(id);
    return meeting;

  }

  Future getStateById(var id) async{
    await MeetingService.meetingState(id);
    meetingState=await MeetingService.stateNamee;
  }



  Future deletion(int id) async{
    message= await MeetingService.deleteMeeting(id);
    for (var m in meet) {
      if (m.id == id) {
        meet.remove(id);
        notifyListeners();
        break;
      }
    }
    return message;
  }












}