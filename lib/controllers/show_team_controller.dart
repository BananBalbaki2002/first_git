


import 'package:flutter/cupertino.dart';
import 'package:tasko/my_models/showTeamModel.dart';
import 'package:tasko/services/team_service.dart';

class ShowTeamController extends ChangeNotifier{
  //****
  var teamModel;
  var tm;
  var t;
  Future<ShowTeamModel> fetchTeam(var id) async{
    teamModel=await TeamService.showTeam(id);
    return await TeamService.showTeam(id);

  }

  Future<ShowTeamModel> fetchMyTeam() async{
    tm=await TeamService.showTeamM();
    return await TeamService.showTeamM();

  }

  Future<ShowTeamModel> fetchLyTeam() async{
    t=await TeamService.showTeamL();
    return await TeamService.showTeamL();
  }
}