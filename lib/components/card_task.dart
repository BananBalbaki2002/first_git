

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/my_app/admin_view/task_details.dart';
import 'package:tasko/components/menu_item.dart';
import '../my_app/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tasko/my_models/task_model.dart';

class cardTask extends StatefulWidget {

int id;
  Task item;
  cardTask({required this.item,required this.id});

  @override
  State<cardTask> createState() => _cardTaskState();
}

class _cardTaskState extends State<cardTask> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var taskController=Provider.of<TaskController>(context);
    return

      GestureDetector(
        onTap: (){
print(widget.item.description);
print(widget.item.title);
print('${widget.item.end_date}');

taskController.id_task=widget.item.id;


       Navigator.pushNamed(context,'/TaskDetail');
        },
        child:


        Container(
        height: size.width*0.32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[200],
//color:Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                //color:Colors.red,
                offset: Offset(-2, -2),
                // spreadRadius: 13,
                blurRadius: 8,
              )
            ]),
        child: Padding(
            padding:  EdgeInsets.fromLTRB(size.width*0.044, size.width*0.047, size.width*0.042, size.width*0.01),
            child:
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child:

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(

                         '${widget.item.title}'
                      ,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: size.width*0.012,
                        ),
                        Text(
                          '${widget.item.description}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),





                        SizedBox(
                          height: size.width*0.09,
                        ),





                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: size.width*0.016,
                            ),
                            Text(
                              '${widget.item.end_date}'

                            ,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blue,fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),

                PopupMenuButton<MenuItem>(
                  onSelected: (item) {

                    taskController.id_task=widget.id;
                    //userController.toAssignId(snapShot.data![index].id);

                    print('id of user........');
                    print(taskController.id_task);
                    return onSelected(
                        context, item, taskController);
                  },
                  itemBuilder: (context) => [
                    ...MenuItems.items
                        .map(buildItem)
                        .toList()
                  ],
                )
              ],
            )),
    ),
      );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
    value: item,
    child: Row(
      children: [
        Icon(
          item.icon,
          color: Colors.black,
          size: 20,
        ),
        SizedBox(
          width: 12,
        ),
        Text(item.text),
      ],
    ),
  );

  void onSelected(BuildContext context, MenuItem item, var taskContr) {
    switch (item) {
      case MenuItems.itemDelete:
        showCupertinoDialog(
            context: context,
            builder: (context) =>

                CupertinoAlertDialog(
              title: Text(
                ' Are you sure about deleting?',
                style: TextStyle(fontSize: 20),
              ),
              content: Text(
                'This will completely delete the user',
                style: TextStyle(fontSize: 16),
              ),
              actions: [
                CupertinoDialogAction(
                  child:
                  Text('OK'),
                  onPressed: () async {
                    await taskContr.onClickDeleteTask();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Deleted the user '),
                    ));
                    print('ok');
                    //update to list
                    Navigator.pop(context);
                  },
                ),
                CupertinoDialogAction(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            )

        );

        break;
      case MenuItems.itemEdit:
        print('yes edited');

        Navigator.pushNamed(context,'/EditTask');

        break;
    }
  }

}