import 'package:tasko/my_models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';



part 'meeting_model.g.dart';


@JsonSerializable(explicitToJson: true)
class  MeetingModel {
  String? meeting_date;
  String? start_at;
  var meeting_status;
  String? updated_at;
  String? created_at;
  var id;


  List<int>? participant_list;
  List<User?>? participants;

  MeetingModel({this.meeting_date,this.start_at,this.meeting_status,this.updated_at,
    this.created_at,this.id,this.participants,this.participant_list
  });
  factory MeetingModel.fromJson(Map <String,dynamic> json) => _$MeetingModelFromJson(json);
  Map<String, dynamic> toJson() => _$MeetingModelToJson(this);
}
