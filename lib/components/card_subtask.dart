
import 'package:flutter/material.dart';
import 'package:tasko/my_models/sub_task_model.dart';

class CardSubTask extends StatelessWidget {
ModelSubTask? lsubtask;
// int index;
CardSubTask({required this.lsubtask});

@override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){


        },
        child: Container(
          height: 120,
          //  width: 250,
          margin:
          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                // color: Colors.red,
                color: Colors.black12,
                offset: Offset(-1, -1),
                spreadRadius: 2,
                blurRadius: 2,
              )
            ],
          ),
          child:


          Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                    20
                ),
                color: Colors.white,
              ),
              margin: EdgeInsets.only(left: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                         '${lsubtask!.title}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          '${ lsubtask!.description}',
                          style: TextStyle(
                              fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            Row(children: [
                              Icon(Icons.calendar_today_outlined,
                                  color:Colors.blue,
                                  size: 13),
                              SizedBox(
                                width: 7,
                              ),
                              Text(

                                '${lsubtask!.end_at}',
                                style: TextStyle(fontWeight: FontWeight.w500,
                                    fontSize: 13,color:Colors.blue),
                              ),

                            ],)
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              )),
        ),
      );
  }
}