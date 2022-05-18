import 'package:flutter/material.dart';

import 'app/screens/dashboard.dart';
import 'app/screens/login_screen.dart';

import 'app/screens/on_boarding.dart';
import 'app/screens/tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'todo app ',
      routes: {
        '/login': (context) => Login(),
        '/Dashboard': (context) => Dashboard(),
        '/Tasks': (context) => Task(),
      },
      home:OnBarding(),
    );
  }
}
