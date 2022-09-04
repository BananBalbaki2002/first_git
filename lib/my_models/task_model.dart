





import 'dart:convert';


import 'package:json_annotation/json_annotation.dart';
import 'package:tasko/my_app/admin_view/sub_task.dart';
import 'package:tasko/my_models/sub_task_model.dart';
part 'task_model.g.dart';
@JsonSerializable(explicitToJson: true)
class Task{



  String? title;
  String? description;
  String? start_date;
  String? end_date;
  var status_id;
  var team_id;
  var id ;
  List<ModelSubTask?>? subtasks;

//var subtasks;

  Task({

   this.title,
   this.description,
   this.start_date,
    this.end_date,
    this.status_id,
    this.team_id,
    this.id,
this.subtasks

});

  factory Task.fromJson(Map <String,dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}
  /*factory  Task.fromJson(Map<String,dynamic> json)=>
Task(
title: json['title'],
  description: json['description'],
  start_date: json['start_date'],
    end_date:json['end_date'],
    status_id:json['status_id'],
    team_id:json['team_id'],
  id:json['id']

);*/
