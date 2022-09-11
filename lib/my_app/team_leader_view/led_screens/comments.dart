
import 'package:flutter/material.dart';
import 'package:comment_box/comment/comment.dart' show CommentBox;
import 'package:provider/provider.dart';
import 'package:tasko/my_app/comment_dec/comment_controller.dart';
import 'package:tasko/my_app/comment_dec/comment_model.dart';
import '../../constants.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  dynamic formKey;
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'Adeleye Ayodeji',
      'pic': 'https://picsum.photos/300/30',
      'message': 'I love to code'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
    {
      'name': 'Biggi Man',
      'pic': 'https://picsum.photos/300/30',
      'message': 'Very cool'
    },
  ];

  Widget commentChild(List<CommentsModel> data) {
    return ListView(
      physics:const BouncingScrollPhysics(),
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  // ignore: avoid_print
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration:  BoxDecoration(
                      color:pu,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',


                      )),
                ),
              ),
              title: Row(
                children: [

                  Text(
                    '${data[i].first_name}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(width: 5,),
                  Text(
                    '${data[i].last_name}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],

              ),
              subtitle: Text('${data[i].body}'),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Comments",style: trackerStyle,),
        backgroundColor: appCo,
        elevation: 0,
      ),
      body:
Consumer<CommentController>(builder:(context,controller,_)=>
    FutureBuilder< List<CommentsModel> >(
  future:controller.fetchAllComment(),
  builder: (context,snapShot){
    //AsyncSnapShot
    if(snapShot.hasData)
      return

        CommentBox(
          userImage:
          "https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400",
          child: commentChild(snapShot.data!),
          labelText: 'Write a comment...',
          withBorder: false,
          errorText: 'Comment cannot be blank',
          sendButtonMethod: () {
           // if (formKey.currentState!.validate())

           if(true){
              // ignore: avoid_print
              print(commentController.text);
              setState(() {
                var value = {
                  'name': 'New User',
                  'pic':
                  'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                  'message': commentController.text
                };
                CommentsModel model=CommentsModel(
                 first_name: '' ,
                  last_name: '',
                  user_id: 1,
                  body:  commentController.text,

                );
                filedata.insert(0, value);
              });
              commentController.clear();
              FocusScope.of(context).unfocus();
            } else {
              // ignore: avoid_print
              print("Not validated");
            }
          },
          formKey: formKey,
          commentController: commentController,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          sendWidget: const Icon(Icons.send_sharp, size: 30, color: Colors.white),
        );



    if(snapShot.hasError)
      return Center(
        child: Text(snapShot.error.toString()),
      );

    return Center(
      child: CircularProgressIndicator(),
    );
  },
))




    );
}}
