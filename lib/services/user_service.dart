


import 'dart:io';


import 'package:tasko/my_models/status_model.dart';
import 'package:tasko/my_models/task_model.dart';
import 'package:tasko/my_models/user_model.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:tasko/config/server_config.dart';

class UserService{




//---------------------------AddUser--------------------------------

  static Future addUser(User user)async{

    var response=await http.post(
      Uri.parse(ServerConfig.domainName+ServerConfig.addUser),
    body:{
        'first_name':user.first_name,
'last_name':user.last_name,
      'email':user.email,
      'employee_identical':user.employee_identical,
      'password':user.password,
      'role_id':user.role_id,
      'team_id':user.team_id
    },
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
        'Accept': 'application/json'
      }


    );

    Map<String,dynamic> json=jsonDecode(response.body);
    print(response.statusCode);
    if(json['the user is:'] == null)
      return null;
    return User.fromJson(json['the user is:']);
  }

//-------------------------EditUser---------------------------
static Future editUser(User user,int id_user)async{

  var response = await http.put(
    Uri.parse(ServerConfig.domainName+ServerConfig.editUser+'${id_user}'),

    body: {
      'first_name':user.first_name,
      'last_name':user.last_name,
      'email':user.email,
      'employee_identical':user.employee_identical,
      'password':user.password,
      'role_id':user.role_id,
      'team_id':user.team_id
    },
    headers: {
      HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
      'Accept': 'application/json'
    }


  );

  Map<String,dynamic> json=jsonDecode(response.body);
  print(response.statusCode);
  if(json['the user is:'] == null)
    return null;

  return User.fromJson(json['the user is:']);


}

//----------------------DeleteUser-------------------------------

static Future deleteUser(int id_user)async{


    var response=await http.delete(
    Uri.parse(ServerConfig.domainName+ServerConfig.deleteUser+'${id_user}'),
    headers: {
      HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
      'Accept': 'application/json'
    },
    );
    Map<String,dynamic> json=jsonDecode(response.body);
    print(response.statusCode);
    print(json['message']);
    if(response.statusCode ==  200){
      return json['message'];
    }
else
  {
    return 'Failed to delete user.';
  }
}
//-----------------------showAllUsers-------------------------

  static Future<List<User>>  servAllUsaer()async{

    var response = await http.get(  Uri.parse(ServerConfig.domainName + ServerConfig.showUsers)
        ,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
              'token')}',
          'Accept': 'application/json'
        });


    Map<String,dynamic> json = jsonDecode(response.body);
    List users = json['the users'];

    List< User > models = [];
    print(response.statusCode);


    for(var us in users){
      models.add(User.fromJson(us));}
    print(models);
    if(models != null) {
      return models;
    }
    else{
      return [];
    }





  }


  //---------------------------------------------------





  static Future< List<User> > fetchUsers()async
  {
    var response = await http.get(
        Uri.parse(ServerConfig.domainName + ServerConfig.showUsers),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
              'token')}',
          'Accept': 'application/json'
        });
    print(response.statusCode);
    print(response.body);
    print('the jsonItems');
    if(response.statusCode ==  200 || response.statusCode ==  201 ) {
      final jsonItems = json.decode(response.body).cast<Map<String,dynamic>>();

      print(jsonItems);

      List<User> userList = jsonItems.map<User>((json) {
        return User.fromJson(json);
      }).toList();
      print('userList is :');
      return userList;
    }
    else{
      return [];
    }


  }











}