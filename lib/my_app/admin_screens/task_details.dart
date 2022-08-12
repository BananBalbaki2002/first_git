
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:tasko/components/custom_button.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/my_app/constants.dart';
import 'package:tasko/components/card_subtask.dart';
import 'package:tasko/my_models/task_model.dart';
import 'package:tasko/my_models/sub_task_model.dart';
import 'package:tasko/services/task_service.dart';


class TaskDetail extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var taskController=Provider.of< TaskController >(context);
    return Scaffold(
        backgroundColor: kBackgroundColor,


        body:SafeArea(
          child:


          Padding(
            padding: const EdgeInsets.only(top:15.0,right: 15,left: 15),
            child:

            FutureBuilder< Task >(
              future: taskController.onClickshowOneTask(),
              builder: (context, snapShot) {
                //AsyncSnapShot
                if (snapShot.hasData)
                  return

                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Row(children: [
                              Icon(Icons.arrow_back),
                              SizedBox(width: 15,),
                              Text('Details',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),

                            ],),

                            CustomButton(height: 40,width: 120, buttonName: taskController.taskstates[taskController.id_task
                            ],buttonColor:Colors.blue,fontSize: 15, onTap: () {  })

                          ],),

                        Container(

                            margin: EdgeInsets.symmetric(vertical: kDefaultPadding+5),
                            child:




                            Column(

                              crossAxisAlignment: CrossAxisAlignment.start,

                              children: [


                                Text(

                '${snapShot.data!.title}'
                ,
                                  style: TextStyle(fontSize: 30,),
                                ),
                                SizedBox(height: 5,),

                                Row(children: [

                                  Expanded(child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${snapShot.data!.description}'
                                        ,
                                        maxLines: 6,
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:Colors.grey[500]
                                        ),
                                      ),
                                      SizedBox(height: 7,),
                                      Row(children: [

                                        Text('${snapShot.data!.start_date}',style: TextStyle(color:Colors.grey[600],fontWeight: FontWeight.bold),),
                                        SizedBox(width: 7,),
                                        Container(color:Colors.grey,height: 15,width: 2,),
                                        SizedBox(width: 7,),
                                        Text('${snapShot.data!.end_date}',style: TextStyle(color:Colors.grey[600],fontWeight: FontWeight.bold),),

                                      ],),

                                      SizedBox(height: 10,),
                                      Container(
                                          width: double.infinity,
                                          margin: EdgeInsets.only(top: 15, bottom: 30),
                                          child: Stack(
                                            alignment: Alignment.centerLeft,
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage: NetworkImage(
                                                    'https://cdn-icons-png.flaticon.com/512/219/219983.png'),
                                              ),
                                              Positioned(
                                                left: 25,
                                                bottom: 0,
                                                top: 0,
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                      'https://createivo.com/images/q1.jpeg'),
                                                ),
                                              ),
                                              Positioned(
                                                left: 45,
                                                bottom: 0,
                                                top: 0,
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH6Uyi30Ty2WkMb0ZjuFLoXmkRwrrMObm-X2zztWtGbOgyA-i7mFzuiSKltN14HLAJDVM&usqp=CAU',
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 65,
                                                bottom: 0,
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                      'https://www.coursle.org/assets/img/user.png'),
                                                ),
                                              ),
                                              Positioned(
                                                left: 85,
                                                bottom: 0,
                                                top: 0,
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH6Uyi30Ty2WkMb0ZjuFLoXmkRwrrMObm-X2zztWtGbOgyA-i7mFzuiSKltN14HLAJDVM&usqp=CAU',
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 105,
                                                bottom: 0,
                                                top: 0,
                                                child: CircleAvatar(
                                                  radius: 20,
                                                  backgroundImage: NetworkImage(
                                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH6Uyi30Ty2WkMb0ZjuFLoXmkRwrrMObm-X2zztWtGbOgyA-i7mFzuiSKltN14HLAJDVM&usqp=CAU',
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )),

                                    ],),),

                                  CircularPercentIndicator(
                                    radius: 75,
                                    lineWidth: 6,
                                    percent: 0.3,
                                    animation: true,
                                    animationDuration: 5000,
                                    center: Text('40%',style: TextStyle(fontWeight: FontWeight.w500),),
                                    progressColor: Colors.teal,
                                  ),
                                ],),

                                //-------------------------------------------------








                              ],)
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('subtasks List',  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                            Text('see all',style: TextStyle(color: Colors.indigo,fontSize: 15, fontWeight: FontWeight.w500),),

                          ],),
                        SizedBox(height: 15,),
                        Expanded(
                            child:

                            Stack(
                                children: [
                                  Container(
                                      margin:EdgeInsets.only(top:10),
                                      padding: EdgeInsets.only(top:10),
                                      decoration: BoxDecoration(
                                        color:Colors.white54,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                        ),
                                      ),

                                      child:

                                      ListView.builder(
                                          itemCount: snapShot.data!.subtasks!.length,
                                          itemBuilder: (context, index) =>


                                              CardSubTask(lsubtask: snapShot.data!.subtasks![index],)


                                      )


                                  ),






                                ])),






                      ],);

                if(snapShot.hasError)
                  return Center(
                    child: Text(snapShot.error.toString()),
                  );
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            )


          ),
        )



    );
  }
}

