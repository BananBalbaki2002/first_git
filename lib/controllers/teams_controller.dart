




import 'package:flutter/cupertino.dart';
import 'package:tasko/my_models/team_model.dart';
import 'package:tasko/services/team_service.dart';

class TeamsController with ChangeNotifier{
  //****
  String? message;

  List<TeamModel> teams=[];
  Future<List<TeamModel>> fetchTeams() async{
    teams=await TeamService.showTeams();
    return await TeamService.showTeams();
  }



  Future deletion(int id) async{
    message= await TeamService.deleteTeam(id);
    for (var t in teams) {
      if (t.id == id) {
        teams.remove(id);
        notifyListeners();
        break;
      }
    }
    return message;
  }
}
