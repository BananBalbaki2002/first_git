



import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:tasko/my_app/notifications_dec/data_model.dart';
import 'package:tasko/my_models/statistics_model.dart';
import 'package:tasko/services/statistics_service.dart';
import 'package:tasko/services/task_service.dart';

class StatisticsController with ChangeNotifier{

  List<MyData>sta_num=[];
   List<MyData> sta_percentage=[];
  TooltipBehavior tooltipBehaviory=TooltipBehavior();



  Future<StatisticsModel> onClickfetchStatistics()async{

    var map_statistic=
    await  StatisticService.fetchStatistics();
    tooltipBehaviory=TooltipBehavior(enable: true);
    sta_num=await StatisticService.sta_num_task;
    //print(sta_num);
   sta_percentage=await StatisticService.sta_percentage_task;
  // print(sta_percentage);



   //print( items_of_allTask);
   return map_statistic;
  }


  Future<StatisticsModel> MServStatistics()async{

    var map_statistic=
    await  StatisticService.MfetchStatistics();
    tooltipBehaviory=TooltipBehavior(enable: true);
    sta_num=await StatisticService.sta_num_task;

    sta_percentage=await StatisticService.sta_percentage_task;
    return map_statistic;
  }






}