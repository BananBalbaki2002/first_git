





import 'package:flutter/cupertino.dart';
import 'package:tasko/my_app/comment_dec/comment_model.dart';

import 'comment_service.dart';

class CommentController with ChangeNotifier{


  List<CommentsModel> l_comments=[];
  Future <List<CommentsModel>> fetchAllComment()async{




    l_comments=await CommentService.AllComments(1);
    print(l_comments[0].body);
return l_comments;

  }






}