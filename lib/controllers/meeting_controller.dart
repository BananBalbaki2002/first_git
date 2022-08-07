



import 'package:tasko/my_models/meeting_model.dart';
import 'package:tasko/my_models/user_model.dart';
import 'package:tasko/services/meeting_service.dart';

class MeetingController{







  Future  onClickeditMeeting()async{

MeetingModel meeting=MeetingModel(
    meeting_date: '2022-08-05',
    start_at:'11:00',
    meeting_statuses_id:'2',
  participant:[User(id: 19),User(id: 20)]

);

   await MeetingServic.editMeeting(meeting);

  }







}