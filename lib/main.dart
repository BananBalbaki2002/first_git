import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'controllers/login_controller.dart';
import 'controllers/task_controller.dart';
import 'controllers/user_controller.dart';
import 'my_app/admin_screens/dashboard.dart';
import 'my_app/admin_screens/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'my_app/admin_screens/on_boarding.dart';
import 'my_app/admin_screens/sub_task.dart';
import 'my_app/admin_screens/tasks_screen.dart';

import 'my_app/admin_screens/task_details.dart';
import 'my_app/admin_screens/users.dart';
import 'my_app/admin_screens/add_user.dart';
import 'my_app/admin_screens/attachement_screen.dart';
import 'my_app/admin_screens/edit_user.dart';

import 'my_app/admin_screens/add_task.dart';
import 'my_app/team_leader_screens/dashboard_team_leader.dart';
import 'my_app/admin_screens/edit_task.dart';
import 'my_app/widgets/my_screen.dart';
import 'my_app/widgets/page_one.dart';
import 'my_app/widgets/second_page.dart';






//import 'package:get_storage/get_storage.dart';




void main()async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserController()),
          ChangeNotifierProvider(create: (_) => TaskController()),
        ],
      child:
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todo app ',
      routes: {

        '/login': (context) => Login(),
        '/Dashboard': (context) => Dashboard(),
        '/Tasks': (context) => TaskScreen(),
        '/AddUser':(context) => AddUser(),
        '/Users':(context)=> Users(),
        '/EditUser':(context) => EditUser(),
        '/AddTask':(context) => AddTask(),
        '/EditTask':(context)=>EditTask(),
        '/TaskDetail':(context)=>TaskDetail(),
       '/PageOne':(context) => PageOne(),
        '/SecondPage':(context)=>SecondPage(),


'/DashboardTeamLeader':(context)=>DashboardTeamLeader()

       },

//home:SecondPage(),

      initialRoute: GetStorage().hasData('token') ? '/Dashboard' : '/login',

      builder: EasyLoading.init(),
    ));
  }
//30211 ......1234567891

  fun(){

    int  role_id=  GetStorage().read('role_id');
    if(role_id == 1)
    {
      return  '/Dashboard';

    }
    else if(role_id == 2){
      return '/DashboardTeamLeader';
    }

  }

  }





