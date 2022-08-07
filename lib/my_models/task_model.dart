





import 'dart:convert';

import 'package:tasko/my_app/admin_screens/sub_task.dart';

List<Task> taskFromJson(String str) =>
    List<Task>.from(jsonDecode(str).map((x) => Task.fromJson(x)));






class Task{

  /*
        "id": 3,
            "title": "Charity management system",
            "description": "this system will help people and financiers",
            "start_date": "2022-08-01",
            "end_date": "2022-10-15",
            "status_id": 1,
            "team_id": 2,
            "created_at": "2022-07-02T11:00:36.000000Z",
            "updated_at": "2022-07-14T22:23:01.000000Z",
   */

  String? title;
  String? description;
  String? start_date;
  String? end_date;
  var status_id;
  var team_id;
  var id ;

//var subtasks;

  Task({

   this.title,
   this.description,
   this.start_date,
    this.end_date,
    this.status_id,
    this.team_id,
    this.id,


});
  factory  Task.fromJson(Map<String,dynamic> json)=>
Task(
title: json['title'],
  description: json['description'],
  start_date: json['start_date'],
    end_date:json['end_date'],
    status_id:json['status_id'],
    team_id:json['team_id'],
  id:json['id']

);
}