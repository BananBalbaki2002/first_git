import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:tasko/controllers/teams_controller.dart';
import 'package:tasko/my_app/calen_pages/page_calendar.dart';

import 'my_app/calen_pages/calendar_controller.dart';
import 'controllers/login_controller.dart';
import 'controllers/meeting_controller.dart';
import 'controllers/task_controller.dart';
import 'controllers/user_controller.dart';
import 'my_app/admin_view/dashboard.dart';
import 'my_app/admin_view/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'my_app/admin_view/on_boarding.dart';
import 'my_app/admin_view/show_user.dart';
import 'my_app/admin_view/sub_task.dart';
import 'my_app/admin_view/tasks_screen.dart';

import 'my_app/admin_view/task_details.dart';
import 'my_app/admin_view/users.dart';
import 'my_app/admin_view/add_user.dart';
import 'my_app/admin_view/edit_user.dart';

import 'my_app/admin_view/add_task.dart';
import 'my_app/calen_pages/all_event_scr.dart';
import 'my_app/calen_pages/edit_event_scr.dart';
import 'my_app/notifications_dec/notification_controller.dart';
import 'my_app/search_widg/search_page.dart';
import 'controllers/statistics_controller.dart';
import 'my_app/admin_view/statistics_screen.dart';
import 'my_app/team_leader_view/led_screens/add_attachement.dart';
import 'my_app/team_leader_view/attachement_controller.dart';
import 'my_app/team_leader_view/led_screens/comments.dart';
import 'my_app/team_leader_view/led_screens/leader_meeting.dart';
import 'my_app/team_leader_view/led_screens/leader_tasks_scre.dart';
import 'my_app/team_leader_view/led_screens/led_attachement_scre.dart';
import 'my_app/team_leader_view/led_screens/led_datails_task.dart';
import 'my_app/team_member_view/dashboard_member.dart';
import 'my_app/team_leader_view/led_screens/dashboard_team_leader.dart';
import 'my_app/admin_view/edit_task.dart';
import 'my_app/team_member_view/member_statistics_scr.dart';
import 'my_app/team_member_view/member_task_scr.dart';
import 'my_app/notifications_dec/notifications_scre.dart';
import 'my_app/admin_view/team_selected.dart';






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
          ChangeNotifierProvider(create: (_)=> MeetingsController()),
          ChangeNotifierProvider(create: (_) =>TeamsController()),
    ChangeNotifierProvider(create: (_) =>StatisticsController()),
          ChangeNotifierProvider(create: (_) =>AttachementController()),
          ChangeNotifierProvider(create: (_) => NotificationController()),
          ChangeNotifierProvider(create: (_) => MyCalendarCont()),



        ],
      child:
    MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'todo app ',
      routes: {

        '/login': (context) => Login(),
        '/Dashboard': (context) => Dashboard(),
        '/TaskScre': (context) => TaskScre(),
        '/AddUser':(context) => AddUser(),
        '/Users':(context)=> Users(),
        '/EditUser':(context) => EditUser(),
        '/AddTask':(context) => AddTask(),
        '/EditTask':(context)=>EditTask(),
        '/TaskDetail':(context)=>TaskDetail(),
'/TeamSelected':(context)=>TeamSelected(),
        '/StatisticsScre':(context)=>StatisticsScre(),
'/SearchPage':(context)=>SearchPage(),
'/MTaskScr':(context)=>MTaskScr(),
        '/LedTaskScreen':(context)=>LedTaskScreen(),
'/user':(context)=>UserScreen(),
        // '/a_subtask':(context){return ASubTask();},
        // '/l_subtask':(context){return LeaderSubTask();},
        // '/msubtask':(context){return MemSubTask();},
        '/MStatisticsScre':(context)=>MStatisticsScre(),
        '/NotificationsScre':(context)=>NotificationsScre(),
'/DashboardTeamLeader':(context)=>DashboardTeamLeader(),
        '/DashboardMember':(context)=>DashboardMember(),
        '/Comments':(context)=>Comments(),
        '/MeetingForLeaderOm ':(context)=>MeetingForLeaderOm(),
'/PageCalendar':(context)=>PageCalendar(),
        '/LAttachementScr':(context)=>LAttachementScr(),
        '/AllEvents':(context)=>AllEvents(),
        '/LDetailsTask':(context)=>LDetailsTask(),
        '/AddAttachement':(context)=> AddAttachement(),
        '/EditEvent':(context)=>EditEventScr(),


       },

//home:PageBanan(),

 initialRoute: GetStorage().hasData('token') ?  fun() : '/login',

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

    else if(role_id == 3){
    return '/DashboardMember';
    }


  }

  }





