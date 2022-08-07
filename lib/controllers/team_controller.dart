


import 'package:tasko/my_models/team_model.dart';
import 'package:tasko/services/team_service.dart';

class TeamController{



  Future onClickAddTeam()async{
    TeamModel teamModel=TeamModel(name: 'My Mobilee Developer');

    await  TeamService.addTeam(teamModel);


  }





}