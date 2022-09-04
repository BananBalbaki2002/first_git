import 'package:tasko/my_models/user_model.dart';

import 'package:json_annotation/json_annotation.dart';
part 'sub_task_model.g.dart';
@JsonSerializable(explicitToJson: true)
class ModelSubTask {
  var id;
  String? title;
  String? description;
  String? start_at;
  String? end_at;
  var priority_id;
  var status_id;
  var task_id;
List<User?>? users;
  List<int>? participants;

  ModelSubTask(
      {this.priority_id,
      this.id,
      this.start_at,
      this.status_id,
      this.description,
      this.title,
      this.end_at,
      this.task_id,
this.users,
        this.participants
      });

  factory ModelSubTask.fromJson(Map <String,dynamic> json) => _$ModelSubTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ModelSubTaskToJson(this);
}
  /*
  
   "id": 6,
                    "title": "backend",
                    "description": "laravel or nodejs",
                    "start_at": "2022-07-01",
                    "end_at": "2022-07-14",
                    "priority_id": 2,
                    "status_id": 1,
                    "task_id": 3,
                    "members": 
 */

