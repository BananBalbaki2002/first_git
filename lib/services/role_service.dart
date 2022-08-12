
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:get_storage/get_storage.dart';
import 'package:tasko/config/server_config.dart';
import 'package:tasko/my_models/model_role.dart';


class RoleService{


  static Future ShowAllRole()async{

    var response = await http.get(
        Uri.parse(ServerConfig.domainName + ServerConfig.showAllRole)


    );


    var json = jsonDecode(response.body);
    List <RoleModel> model=[];
    for(var st in json) {
      if (st['id'] != 1) {
        model.add(RoleModel.fromJson(st));
      }

      if (model != null) {
        return model;
      }
      else {
        return [];
      }
    }}





//------------------------------OneStatus----------------

  static Future ShowOneRole()async{

    var response = await http.get(
        Uri.parse(ServerConfig.domainName + ServerConfig.showOneRole)
        ,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
              'token')}',
          'Accept': 'application/json'
        });


    Map<String, dynamic> json = jsonDecode(response.body);

    return
      RoleModel.fromJson(json);

  }







}
