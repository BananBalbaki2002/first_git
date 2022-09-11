


import 'dart:convert';
class ProfileModel{



  String? img_profile;
String phone;
String contact;
String  education;
String experience;
var user_id;
var id;


ProfileModel({
 required this.contact,required this.education,required this.experience,
  required this.phone, this.id, this.user_id,this.img_profile});




factory  ProfileModel.fromJson(Map<String,dynamic> json)=>
    ProfileModel(
        img_profile:json['img_profile'],
        experience: json['experience'],
      phone: json[' phone'],
        contact: json['contact'],
      user_id:json['user_id'],
        id:json['id'],
      education:json['education']


    );

}