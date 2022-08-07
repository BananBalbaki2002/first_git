

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/my_app/models/mod_tasks.dart';
import 'package:tasko/my_app/admin_screens/task_details.dart';
import 'package:tasko/components/menu_item.dart';
import '../my_app/constants.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:tasko/my_models/task_model.dart';

class cardTask extends StatefulWidget {


  Task? item;
  cardTask({required this.item});

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
       Navigator.pushNamed(context,'/TaskDetails');
        },
        child:


        Container(
        height: size.width*0.43,
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
            padding:  EdgeInsets.fromLTRB(size.width*0.044, size.width*0.033, size.width*0.042, size.width*0.01),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(

                         '${widget.item!.title}'
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
                          '${widget.item!.description}',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: size.width*0.05,
                        ),
                        Text(
                          'Team members ',
                          style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                        ),
                        SizedBox(
                          height: size.width*0.012,
                        ),
                        Container(
                            width: double.infinity,
                            child: Stack(
                              alignment: Alignment.centerLeft,
                              children: [
                                CircleAvatar(
                                  radius: 15,
                                  backgroundImage: NetworkImage(
                                      'https://cdn-icons-png.flaticon.com/512/219/219983.png'),
                                ),
                                Positioned(
                                  left: 20,
                                  bottom: 0,
                                  top: 0,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(
                                        'https://createivo.com/images/q1.jpeg'),
                                  ),
                                ),
                                Positioned(
                                  left: 40,
                                  bottom: 0,
                                  top: 0,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH6Uyi30Ty2WkMb0ZjuFLoXmkRwrrMObm-X2zztWtGbOgyA-i7mFzuiSKltN14HLAJDVM&usqp=CAU',
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 60,
                                  bottom: 0,
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundImage: NetworkImage(
                                        'https://www.coursle.org/assets/img/user.png'),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: size.width*0.06,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_today_outlined,
                              size: 20,
                              color: kblue,
                            ),
                            SizedBox(
                              width: size.width*0.013,
                            ),
                            Text(
                              '${widget.item!.end_date}'

                            ,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.grey[600]),
                            ),
                          ],
                        )
                      ],
                    )),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PopupMenuButton<MenuItem>(
                          onSelected: (item) {
                            taskController.id_task=widget.item!.id;

                            //taskController.toAssignId(widget.item!.id);
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

                         //icon: Icon(Icons.more_horiz),
                        ),

                        SizedBox(
                          height: 14,
                        ),


                        CircularPercentIndicator(
                          radius: 90,
                          lineWidth: 6,
                          percent: 0.3,
                          animation: true,
                          animationDuration: 5000,
                          center: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '30',
                                style: TextStyle(color: Colors.teal),
                              ),
                              Text(
                                '%',
                                style: TextStyle(color: Colors.teal),
                              ),
                            ],
                          ),
                          progressColor: Colors.teal,
                        )



                      ],
                    )),
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
            builder: (context) => CupertinoAlertDialog(
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
                  child: Text('OK'),
                  onPressed: () async {
                    //EasyLoading.show(status: 'loading...');
                    await taskContr.onClickDeleteTask();
                    if(taskContr.message== 'Deleted successfully'){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Deleted the task '),
                    ));


                    print('ok');
                    //update to list
                    }
                    else{

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(' can not Deleted the task '),
                      ));
                    }
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
            ));

        break;
      case MenuItems.itemEdit:
        print('yes edited');

        Navigator.pushNamed(context, '/EditTask');

        break;
    }
  }

}