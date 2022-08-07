import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:tasko/config/server_config.dart';
import 'package:tasko/my_app/admin_screens/login_screen.dart';
import 'package:tasko/my_models/task_model.dart';

class  TaskService{


  //----------------------- add Task ----------------------------

  static Future addTask(Task taskModel)async{

    var response=await http.post(
        Uri.parse(ServerConfig.domainName+ServerConfig.addTask),
        body:{

          'title':taskModel.title        ,
          'description':  taskModel.description     ,
          'start_date':taskModel.start_date     ,
          'end_date':  taskModel.end_date   ,
          'team_id':   taskModel.team_id   ,
          'status_id':   taskModel.status_id
        },
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
          'Accept': 'application/json'
        }
    );
    Map<String,dynamic> json=jsonDecode(response.body);
    print(response.statusCode);
    print(response.body);
    if(json['tha task is:'] == null)
      return null;
    return Task.fromJson(json['tha task is:']);
  }
//----------------------EditTask---------------------

  static Future editTask(Task taskModel,int id_task)async{
print(id_task);
    var response = await http.put(
        Uri.parse(ServerConfig.domainName+ServerConfig.editTask+'${id_task}'),

        body: {
          'title':taskModel.title        ,
          'description':  taskModel.description     ,
          'start_date':taskModel.start_date     ,
          'end_date':  taskModel.end_date   ,
          'team_id':   taskModel.team_id   ,
          'status_id':   taskModel.status_id
        },
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
          'Accept': 'application/json'
        }


    );

    Map<String,dynamic> json=jsonDecode(response.body);

    print(response.statusCode);
    if(json['tha task after updated is:'] == null)
      return null;
    return Task.fromJson(json['tha task after updated is:']);

  }
  //-----------------DeleteTask-----------------------

  static Future deleteTask(int id_task)async{


    var response=await http.delete(
      Uri.parse(ServerConfig.domainName+ServerConfig.deleteTask+'${id_task}'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
        'Accept': 'application/json'
      },
    );
    Map<String,dynamic> json=jsonDecode(response.body);
    print(response.statusCode);
    print(json['message']);
    if(response.statusCode ==  201 || response.statusCode ==  200){
      return json['message'];
    }
    else
    {
      return 'Failed to delete user.';
    }
  }
  //--------------------showAllTask---------------
  static Future<List<Task>> showAllTasks()async{
    var response=await http.get(Uri.parse(ServerConfig.domainName+ServerConfig.showTasks),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
          'Accept': 'application/json'
        });

    print(response.statusCode);
    // print(response.body);
    if(response.statusCode ==  200){
      // allUsers  (obj from class Users)

      // var allUsers = usersFromJson(response.body);
      var allTasks=taskFromJson(response.body);
      // users  (list<user>)
      print('the list of task is ......');
      print(allTasks);

      return allTasks;
      // return allUsers.users;
    }
    else
      return [];


  }


  static Future<List<Task>> fetchTasks()async {
    var response = await http.get(
        Uri.parse(ServerConfig.domainName + ServerConfig.showTasks),
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
              'token')}',
          'Accept': 'application/json'
        });
    print(response.statusCode);
     print(response.body);
     print('the jsonItems');
    if(response.statusCode ==  200) {
      final jsonItems = jsonDecode(response.body).cast<Map<String, dynamic>>();


      print(jsonItems);
      List<Task> taskList = jsonItems.map<Task>((json) {
        return Task.fromJson(json);
      }).toList();
      return taskList;
    }
    else{
      return [];
  }


  }


  static Future<List<Task>>  servAllTasks()async{

    var response = await http.get(  Uri.parse(ServerConfig.domainName + ServerConfig.showTasks)
        ,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
              'token')}',
          'Accept': 'application/json'
        });


    var json = jsonDecode(response.body);
    List tasks = json ;

    List< Task > models = [];
    print(response.body);
    print(response.statusCode);
    print(tasks);

    for(var us in tasks ){
      print(us);
      models.add(Task.fromJson(us));}
    print(models);
    return models;






  }
  //-------------------CompletedTask-------
  static Future<List<Task>>  servCompletedTasks()async{

    var response = await http.get(  Uri.parse(ServerConfig.domainName + ServerConfig.showCompletedTasks)
        ,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
              'token')}',
          'Accept': 'application/json'
        });


    Map<String,dynamic> json = jsonDecode(response.body);

    List compTask = json['the completed task'];

    List< Task > models = [];
    print(response.statusCode);


    for(var ta in compTask){
      models.add(Task.fromJson(ta));}
    print(models);
    if(models != null) {
      return models;
    }
    else{
      return [];
    }






  }

//-------------------Missed Task---------------------

  static Future<List<Task>>  servMissedTasks()async{

    var response = await http.get(  Uri.parse(ServerConfig.domainName + ServerConfig.showMissedTasks)
        ,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
              'token')}',
          'Accept': 'application/json'
        });


    Map<String,dynamic> json = jsonDecode(response.body);

    List missedTask = json['missed task'];

    List< Task > models = [];
    print(response.statusCode);


    for(var ta in missedTask){
      models.add(Task.fromJson(ta));}
    print(models);
    if(models != null) {
      return models;
    }
    else{
      return [];
    }






  }

//---------------------Onprogress----------------

  static Future<List<Task>>  servOnprogressTasks()async{

    var response = await http.get(  Uri.parse(ServerConfig.domainName + ServerConfig.showOnProgressTasks)
        ,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
              'token')}',
          'Accept': 'application/json'
        });


    Map<String,dynamic> json = jsonDecode(response.body);

    List missedTask = json['on progress task'];

    List< Task > models = [];
    print(response.statusCode);


    for(var ta in missedTask){
      models.add(Task.fromJson(ta));}
    print(models);
    if(models != null) {
      return models;
    }
    else{
      return [];
    }






  }

//---------------------showOneTask----------------------

static  Future   servOneTask()async{

    int id=5;

    var response=await http.get(
      Uri.parse(ServerConfig.domainName+ServerConfig.showOneTask+'${id}'),

     headers: {
       HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read(
           'token')}',
       'Accept': 'application/json'

     }



    );

    var json=jsonDecode(response.body);

    print(json);







}









}