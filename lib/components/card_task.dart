

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
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
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
                              color: kblue,
                            ),
                            SizedBox(
                              width: size.width*0.016,
                            ),
                            Text(
                              '${widget.item.end_date}'

                            ,
                              style: TextStyle(
                                  fontSize: 13, color: Colors.indigo,fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )),

              ],
            )),
    ),
      );
  }



}