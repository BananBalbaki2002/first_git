import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:tasko/config/server_config.dart';
import 'package:tasko/controllers/login_controller.dart';

import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/controllers/user_controller.dart';
import 'package:tasko/my_app/notifications_dec/notification_controller.dart';
import 'package:tasko/my_app/notifications_dec/notification_service.dart';
import 'package:tasko/my_app/profile_dec/profile_controller.dart';
import 'package:tasko/my_app/profile_dec/profile_service.dart';
import 'package:tasko/services/task_service.dart';

import '../../constants.dart';
import '../../../services/attachement_service.dart';

class DashboardTeamLeader extends StatelessWidget {
  UserController userController = UserController();

  List<String> nameArea = [
    'teams',
    'Report',
    'MyTasks',
    'Calender',
    'Meeting',
    'Statistics'
  ];

  List pushtoArea = [
    '/LedTaskScreen',
    '/LedTaskScreen',
    '/LedTaskScreen',
    '/PageCalendar',
    '/LedTaskScreen',
    '/StatisticsScre'
  ];
  List imgArea = [
    'images/metting.png',
    'images/first.png',
    'images/first.png',
    'images/tasks.png',
    'images/first.png',
    'images/metting.png',
  ];

  LoginController loginController = LoginController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: buildAppBar(
          text: 'Dashboard',
          suffixIcon: Icons.notifications_outlined,



          onPressedSuf: () async {
             Navigator.pushNamed(context,'/NotificationsScre');

          }),
      body: Padding(
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
          staggeredTileBuilder: (int index) => (index + 1) % 3 == 0
              ? StaggeredTile.extent(2, size.width * 0.44)
              : StaggeredTile.extent(1, size.width * 0.43),
        ),
      ),
      drawer: Drawer(
          child: ListView(scrollDirection: Axis.vertical, children: [
        DrawerHeader(
            padding: EdgeInsets.zero,
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                ),


  Padding(
    padding: const EdgeInsets.only(top:20.0,left: 10,bottom: 10),
    child:

    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [





       CircleAvatar(
           radius: 35,
           backgroundColor: Colors.white,
           child:Center(child:
           Text('${GetStorage().read('first_name')[0].toUpperCase()+
               GetStorage().read('last_name')[0].toUpperCase()}',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.w500),))



       )
      ,


        Spacer(),
       Column(crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Row(children: [
           Text('${GetStorage().read('first_name')}',style: TextStyle(color: Colors.white,fontSize: 15),),
           SizedBox(width: 5,),
           Text('${GetStorage().read('last_name')}',style: TextStyle(color: Colors.white,fontSize: 15),),
         ],),
         SizedBox(height: 5,),
         Text('${GetStorage().read('email')}',style: TextStyle(color: Colors.white70),),


       ],

       )
      ],),
  )

              ],
            )),
        GetStorage().read('has_profile')
            ? ListTile(
                title: Text(' My Profile'),
                leading: Icon(Icons.person_outline),
                onTap: () {
                  Navigator.pushNamed(context, '/ProfileScr');
                },
              )
            : ListTile(
                title: Text('Add Profile'),
                leading: Icon(Icons.person_outline),
                onTap: () {

                  Navigator.pushNamed(context, '/AddProfile');
                },
              ),
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.logout_outlined),
          onTap: () async {
            EasyLoading.show(status: 'Loading....');

            await loginController.onClickLogout();

            Navigator.pushReplacementNamed(context, '/login');
            EasyLoading.showSuccess(loginController.message);
          },
        ),
      ])),
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
        child: Column(
          children: [
            Text(
              nameArea[index],
              style: TextStyle(
                  color: (index + 1) % 3 == 0 ? Colors.black : Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20),
            ),
            Expanded(
              child: Image.asset(imgArea[index]),
            )
          ],
        ));
  }
}
