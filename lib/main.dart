import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import 'controllers/login_controller.dart';
import 'my_app/screens/dashboard.dart';
import 'my_app/screens/login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'my_app/screens/tasks_screen.dart';

import 'my_app/screens/task_details.dart';
import 'my_app/screens/users.dart';
import 'my_app/screens/add_user.dart';
import 'my_app/screens/attachement_screen.dart';
import 'my_app/screens/edit_user.dart';

import 'my_app/widgets/my_screen.dart';

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
    /*  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginController()),

        ],
      child: //materialapp....
      );
      */



      MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todo app ',
      routes: {
        '/login': (context) => Login(),
        '/Dashboard': (context) => Dashboard(),
        '/Tasks': (context) => Task(),
      },

home:Users(),
//        initialRoute: GetStorage().hasData('token') ? '/Dashboard' : '/login',
      builder: EasyLoading.init(),
    );
  }
}
