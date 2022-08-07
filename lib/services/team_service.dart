import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:tasko/config/server_config.dart';
import 'package:tasko/my_models/team_model.dart';

class TeamService{

  static Future addTeam(TeamModel team)async{

    var response =await http.post(Uri.parse(ServerConfig.domainName+ServerConfig.addTeam),

    body:{
'name':team.name

    },
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
          'Accept': 'application/json'
        }

    );

    Map<String,dynamic> json=jsonDecode(response.body);
    print('json is ');
    print(GetStorage().read('token'));
    print(response.statusCode);
    print(response.body);
    print(json['message']);
     return TeamModel.fromJson(json['tha department:']);


  }




}