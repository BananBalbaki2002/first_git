
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:tasko/controllers/login_controller.dart';
import 'package:tasko/my_app/profile_dec/profile_controller.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/controllers/user_controller.dart';
import 'package:tasko/controllers/meeting_controller.dart';
import 'package:tasko/my_app/constants.dart';
import 'package:tasko/controllers/statistics_controller.dart';
import 'package:tasko/my_app/calen_pages/calendar_controller.dart';
import 'package:tasko/services/statistics_service.dart';
import 'package:tasko/services/role_service.dart';
import 'package:tasko/services/search_service.dart';
import 'package:tasko/services/task_service.dart';

class Dashboard extends StatelessWidget {
  //UserController  userController=UserController();
  //MeetingController meetingController=MeetingController();
 // TaskController taskController=TaskController();
  List<String> nameArea = [
    'teams',
    'Users',
    'Report',
    'Tasks',
    'Calender',
    'Meetings',
    'Statistics',

  ];

  List imgArea=[
    'images/metting.png',
    'images/first.png',
    'images/first.png',
    'images/tasks.png',
    'images/first.png',
    'images/metting.png',
    'images/tasks.png',




  ];
  List pushtoArea=[


    '/Users',
    '/Users',
    '/Users',
    '/TaskScre',
    '/PageCalendar',
    //   '/Metting'
    '/Users',
    '/StatisticsScre',


  ];

  LoginController loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor:Colors.blue,
      appBar: buildAppBar(text: 'Dashboard',suffixIcon:Icons.logout_outlined ,

          onPressedSuf:()async{


            EasyLoading.show(status: 'Loading....');

            await loginController.onClickLogout();

            Navigator.pushReplacementNamed(
                context, '/login');
            EasyLoading.showSuccess(loginController.message);




          },
      ),



      body:   Padding(
        padding: EdgeInsets.only(
            top: size.width * 0.04,
            bottom: 0,
            left: size.width * 0.004,
            right: size.width * 0.004),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount: nameArea.length,
          itemBuilder: (context, index) => InkWell(
              onTap: () {


                Navigator.pushNamed(context, pushtoArea[index]);
              },
              child:

              // cardArea(nameArea: nameArea,index:index),
              cardArea(index)),
          staggeredTileBuilder: (int index) =>
          (index ) % 3 == 0
              ? StaggeredTile.extent(2, size.width * 0.44)
              : StaggeredTile.extent(1, size.width * 0.43),
        ),
      ),





    );






  }

  Container cardArea(int index) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: (index + 1) % 3 == 0 ? Colors.white : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(-2, -2),
                blurRadius: 3,
              )
            ]),
        child:
        Column(

          children: [
            Text(
              nameArea[index],
              style: TextStyle(
                  color: (index + 1) % 3 == 0 ? Colors.black: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),

            Expanded(child:  Image.asset(imgArea[index]),)
          ],
        )


    );
  }
}
