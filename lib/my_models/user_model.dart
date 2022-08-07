


import 'package:flutter/cupertino.dart';
import 'dart:convert';
//------------------------------------------------------------
// To parse this JSON data, do
//
//  final user = userFromJson(jsonString);

Users usersFromJson(String str) =>  Users.fromJson(json.decode(str));

List<User> userFromJson(String str) =>
    List<User>.from(jsonDecode(str).map((x) => User.fromJson(x)));


class Users {
  List<User> users;

  Users({
    required this.users,
  });
// decode for data
  // key:value
  //List<User>.from .....fun..... convert to map for every item
  factory Users.fromJson(Map<String, dynamic> json) => Users(
    users: List<User>.from(json["users"].map((x) => User.fromJson(x))),

  );


}





//----------------------------------------------


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


factory  User.fromJson(Map<String,dynamic> json)=>
    User(
      first_name: json['first_name'],
        last_name: json['last_name'],
        email:json['email'],
      employee_identical:json['employee_identical'],
     password:json['password'],
     role_id:json['role_id'],
      team_id:json['team_id'],
      id: json['id']
    );



  }




