
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:tasko/config/server_config.dart';
import 'package:tasko/my_app/notifications_dec/data_model.dart';
import 'package:tasko/my_models/statistics_model.dart';


class StatisticService{

  static  List<MyData>sta_num_task=[];
  static List<MyData> sta_percentage_task=[];

  static Future<StatisticsModel>  fetchStatistics()async{
    var response=await http.get(
        Uri.parse(ServerConfig.domainName+'api/show/statistic'),

        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
          'Accept': 'application/json'
        }
    );
    Map<String,dynamic> json=jsonDecode(response.body);
    print(response.statusCode);
   // print(response.body);

List<MyData> staResonse=[];

    json.forEach((k, v) =>staResonse.add(MyData(k,v)));
    print(staResonse.length);
print('in loop ');
if(sta_num_task.length == 0 && sta_percentage_task.length ==0){
  for(var s in staResonse){
    //print(s.name);
    //print(s.percent);
    if(s.name!.contains('num')){
      //print('num');
      sta_num_task.add(MyData(s.name,s.percent));


    }
    if(s.name!.contains('percentage') ){
      //print('percentage');
      sta_percentage_task.add(MyData(s.name,s.percent));

    }
  }

}



print('percent ');
//print(sta_percentage_task);
print(sta_percentage_task.length);
print('num');
//print(sta_num_task);
print(sta_num_task.length);

return StatisticsModel.fromJson(json) ;

  }



  static Future<StatisticsModel>  MfetchStatistics()async{
    var response=await http.get(
        Uri.parse(ServerConfig.domainName+'api/show/member/statistic'),

        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${GetStorage().read('token')}',
          'Accept': 'application/json'
        }
    );
    Map<String,dynamic> json=jsonDecode(response.body);
    print(response.statusCode);
    // print(response.body);

    List<MyData> staResonse=[];

    json.forEach((k, v) =>staResonse.add(MyData(k,v)));
    print(staResonse.length);
    print('in loop ');
    if(sta_num_task.length == 0 && sta_percentage_task.length ==0){
      for(var s in staResonse){
        //print(s.name);
        //print(s.percent);
        if(s.name!.contains('num')){
          //print('num');
          sta_num_task.add(MyData(s.name,s.percent));


        }
        if(s.name!.contains('percentage') ){
          //print('percentage');
          sta_percentage_task.add(MyData(s.name,s.percent));

        }
      }

    }



    print('percent ');
//print(sta_percentage_task);
    print(sta_percentage_task.length);
    print('num');
//print(sta_num_task);
    print(sta_num_task.length);

    return StatisticsModel.fromJson(json) ;

  }





}