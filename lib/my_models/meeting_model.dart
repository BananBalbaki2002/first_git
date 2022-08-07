import 'package:tasko/my_models/user_model.dart';

class MeetingModel {
  String? meeting_date;
  String? start_at;
  var id;
  var meeting_statuses_id;
  List participant;
  MeetingModel(
      {this.meeting_date,
      this.meeting_statuses_id,
      this.id,
      this.start_at,
      required this.participant});

  factory MeetingModel.fromJson(Map<String, dynamic> json) => MeetingModel(
        meeting_date: json[' meeting_date'],
        start_at: json['start_at'],
        id: json['id'],
        meeting_statuses_id: json['meeting_statuses_id'],
        participant: json['with'],
      );
}
