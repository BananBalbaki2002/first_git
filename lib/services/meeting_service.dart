
import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;

import 'package:tasko/my_models/meeting_model.dart';

class MeetingServic{


static int index=0;
static Future editMeeting(MeetingModel meeting)async{
  var response=await http.post(
      Uri.parse('http://192.168.1.102:8000/api/admin/meeting/update/8'),
      body:{
        'meeting_date':  meeting.meeting_date,
        'start_at':meeting.start_at,
       ' meeting_statuses_id':meeting.meeting_statuses_id,
        'participant_list[${index}]': meeting.participant[index]!.id.toString(),
      },
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
        'Accept': 'application/json'
      }
  );
  Map<String,dynamic> json=jsonDecode(response.body);
  print(response.statusCode);
  print(response.body);
  print('Updating successfully');
  print(json['Updating successfully']);
  print('with');
  print(json['with']);
  if(json == null)
    return null;
  return MeetingModel.fromJson(json);
}



}