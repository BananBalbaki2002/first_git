

import 'package:json_annotation/json_annotation.dart';

import 'package:flutter/cupertino.dart';
import 'dart:convert';
//------------------------------------------------------------
// To parse this JSON data, do
//
//  final user = userFromJson(jsonString);







//----------------------------------------------

/*
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable(explicitToJson: true)*/
part 'user_model.g.dart';
@JsonSerializable()
class User{
  String? first_name;
  String? last_name;
  String? email;
  String? employee_identical;
  String? password;
  var role_id;
  var  team_id;
var id;

 User({
   this.first_name,
    this.last_name,
   this.email,
    this.employee_identical,
   this.password,
    this.role_id,
    this.team_id,
   this.id
 });


  factory User.fromJson(Map <String,dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);


  }




