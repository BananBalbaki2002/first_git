
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:get_storage/get_storage.dart';
import 'package:tasko/config/server_config.dart';
import 'package:tasko/my_app/comment_dec/comment_model.dart';

class CommentService{





  static Future MyComments()async{

    var response =await http.get(Uri.parse(ServerConfig.domainName+ServerConfig.showMyComments),

      headers: {
        'Authorization':'Bearer  ${GetStorage().read('token')}',
        'Accept':'application/json',
      },
    );

Map<String,dynamic> data=jsonDecode(response.body);
List<CommentsModel> l_myComment=[];
print(data['the comment is:']);

for(var com in data['the comment is:']){
l_myComment.add(CommentsModel.fromJson(com));
}
print(l_myComment[0].body);


return l_myComment;
  }





  static Future<List<CommentsModel>> AllComments(int id_task)async{

    var response =await http.get(Uri.parse(ServerConfig.domainName+ServerConfig.showAllComment+'${id_task}'),

      headers: {
        'Authorization':'Bearer  ${GetStorage().read('token')}',
        'Accept':'application/json',
      },
    );


   var data=jsonDecode(response.body);
CommentsModel commentsModel;
List<CommentsModel> l_allComments=[];
var l_id_users=[];
print(data[0]['id']);
for(int i=0;i<data.length; i++){

commentsModel=CommentsModel(
id: data[i]['id'],
  user_id: data[i]['user_id'],
  task_id: data[i]['task_id'],
  first_name: data[i]['first_name'],
  last_name: data[i]['last_name'],
  body: data[i]['body']
);
l_allComments.add(commentsModel);

l_id_users.add(data[i]['user_id']);

}

print(l_id_users);
return l_allComments;



  }



}