import 'package:tasko/my_models/user_model.dart';

class SubTask {
  var id;
  String? title;
  String? description;
  String? start_at;
  String? end_at;
  var priority_id;
  var status_id;
  var task_id;
 List<User>? members;


  SubTask(
      {this.priority_id,
      this.id,
      this.start_at,
      this.status_id,
      this.description,
      this.title,
      this.end_at,
      this.task_id,
      this.members
      });

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

  factory SubTask.fromJson(Map<String, dynamic> json) => SubTask(
      title: json['title'],
      description: json['description'],
      start_at: json['start_at'],
      end_at: json['end_at'],
      status_id: json['status_id'],
      task_id: json['task_id'],
      priority_id: json['priority_id'],
      members: json['members'],
      id: json['id']);
}