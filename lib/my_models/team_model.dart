


class TeamModel{

final String name;
final  int? id;



TeamModel({

  required this.name,
  this.id

});

factory  TeamModel.fromJson(Map<String,dynamic> json)=>
    TeamModel(name: json['name'],
    id:json['id']

    );






}