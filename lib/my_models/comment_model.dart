

class CommentModel{







var id;
  String? body;
  var user_id;
  var task_id;
  String? first_name;
  String? last_name;

CommentModel({this.task_id,this.user_id,this.id,this.body,this.last_name,this.first_name});

factory CommentModel.fromJson(Map<String,dynamic> json) => CommentModel(
  task_id:json['task_id'] ,
  user_id: json['user_id'],
  id: json['id'],
  body: json['body'],
  last_name: json['last_name'],
  first_name:json['first_name']

);


}