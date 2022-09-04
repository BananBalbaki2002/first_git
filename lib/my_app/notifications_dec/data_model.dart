

import 'package:tasko/my_models/meeting_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tasko/my_models/task_model.dart';



part 'data_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LDataModel{

  String note;
  var  title;

  LDataModel(this.note,this. title);


  factory LDataModel.fromJson(Map <String,dynamic> json) => _$LDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$LDataModelToJson(this);



}