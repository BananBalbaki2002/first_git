

class CommentsModel{

   var id;
  String? body;
  var user_id;
  var task_id;
  String? first_name;
  String? last_name;


  CommentsModel({this.body,this.task_id,this.id,this.first_name,this.last_name,this.user_id});

  factory CommentsModel.fromJson(Map<String,dynamic> json)=>CommentsModel(


    id:json['id'],
    task_id: json['task_id'],
    first_name: json['first_name'],
    last_name: json['last_name'],
    user_id: json['user_id'],
    body: json['body']



  );


}