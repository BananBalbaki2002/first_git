


import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tasko/components/custom_field.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/my_app/admin_screens/add_user.dart';
import 'package:intl/intl.dart';

import '../constants.dart';// for DateFormat.
class EditTask extends StatefulWidget {

  //TaskController taskController=TaskController();




  List<int>teamIdList=[1,2,3,4];
  List<int> statusIdList=[1,2,3];



  @override
  State<EditTask> createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {


  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    var taskController=Provider.of<TaskController>(context);

    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Icon(Icons.arrow_back,
                      color: Colors.white,size: 25,),

                    Text(
                      'EditTask',
                      style: TextStyle(color: Colors.white, fontSize: 27),
                    ),
                    SizedBox(

                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          //---------TitleTask-------------------------------------
                          InputField(widget: CustomField(

                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'Title',
                            hintColor: Colors.grey[700],
                            isPassword: false,
                            controller:taskController.titleController ,
                            colorField: Colors.grey[100],)


                              , title: 'Title'),


//------------------------------description-----------------------------
                          InputField(widget: CustomField(

                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'Descroption', isPassword: false,
                            controller:taskController.descriptionController,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                              , title: 'Description'),

//-------------------start_date------------------------
                          InputField(widget: CustomField(
                            iconWidget: IconButton(
                              icon:Icon(Icons.calendar_today_outlined),
                              onPressed: (){

                                fetchDateFromUser(context,taskController,true);

                              },
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,
                            hintText: DateFormat.yMd().format(taskController.selectedStartDate), isPassword: false,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                            , title:'Start_Date' ,

                          ),

//------------------------------endDate----------------------
                          InputField(widget: CustomField(
                            iconWidget: IconButton(
                                icon:Icon(Icons.calendar_today_outlined),
                                color: Colors.blue,
                                onPressed: () {

                                  fetchDateFromUser(context,taskController,false);

                                }
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,
                            hintText: DateFormat.yMd().format(taskController.selectedEndDate),
                            isPassword: false,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                            , title:'End_Date' ,

                          ),

//------------------teamid-----------------------------

                          InputField(widget: CustomField(
                            iconWidget: DropdownButtonHideUnderline(
                              child:   DropdownButton(
                                icon:Icon(Icons.keyboard_arrow_down,color:Colors.grey,),
                                iconSize: 30,
                                elevation: 4,
                                items: widget.teamIdList.map(kbuildMenuItem).toList(),
                                underline: Container(height: 0,),
                                onChanged:(String ?value)=>

                                    setState(() {
                                      taskController.selectedIdTeam=int.parse(value!);
                                    }),
                                //style: ,


                              ),
                            ),
                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'${taskController.selectedIdTeam} selected_Id_Team', isPassword: false,

                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],) , title: 'IdTeam'),
//------------------------------StatusID----------------------------------
                          InputField(widget: CustomField(
                            iconWidget:

                            DropdownButtonHideUnderline(
                              child:   DropdownButton(
                                icon:Icon(Icons.keyboard_arrow_down,color:Colors.grey,),
                                iconSize: 30,
                                elevation: 4,
                                items: widget.statusIdList.map(kbuildMenuItem).toList(),
                                onChanged:(String ?value)=>
                                    setState(() {
                                      taskController.selectedIdStatus=int.parse(value!);
                                    }),
                              ),
                            ),



                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'${taskController.selectedIdStatus} selected_Id_Status', isPassword: false,

                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],) , title: 'Id_Status'),
                        ]


                        ),
                      )
                  ),
                ),
              ),





            ]),

      ),

      floatingActionButton: FloatingActionButton(backgroundColor:Colors.indigo,onPressed: () async {


        print(taskController.id_task);

        EasyLoading.show(status: 'loading...');
        await taskController.onClickEditTask();

        if(taskController.editedTask != null){
          EasyLoading.showSuccess('new user is edited');
          Navigator.of(context).pop();


        }
        else {
          EasyLoading.showError('can not edit ');
        }






      },child: Icon(Icons.check_outlined),) ,

    );
  }

  fetchDateFromUser(var context,TaskController taskContr,bool isStartDate)async{
    DateTime? pickerDate= await showDatePicker(
        context: context,initialDate:DateTime.now() ,firstDate:DateTime.now(),
        lastDate:DateTime(2126)

    );

    if(pickerDate !=null){
      if(isStartDate ==true) {
        setState(() {
          taskContr.selectedStartDate = pickerDate;
          print(taskContr.selectedStartDate);
        });
      }
      else if(isStartDate == false){
        setState(() {
          taskContr.selectedEndDate = pickerDate;
          print(taskContr.selectedEndDate);
        });


      }


    }



  }




}
