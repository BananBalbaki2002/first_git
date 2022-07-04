
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tasko/my_app/screens/task_details.dart';

import '../constants.dart';
import '../screens/card_subtask.dart';


class MyScreen extends StatefulWidget {
  int currentIndex = 0;
  TextEditingController searchController=TextEditingController();
  List<Color> coloritem = [
    Colors.indigo,
    Colors.purple,
    Colors.deepOrange,
    Colors.orangeAccent,
    Colors.teal,
    Colors.red,
  ];

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(











      bottomNavigationBar: Theme(

        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: Colors.grey[300])),

        child: CurvedNavigationBar(

            height: 60,
            // animationCurve: Curves.easeInOut,
            // animationDuration: Duration(milliseconds: 600),
            color: Colors.indigo,
            backgroundColor: Colors.transparent,
            buttonBackgroundColor: kblue,
            index: widget.currentIndex,
            onTap: (index) {
              setState(() {
                widget.currentIndex = index;
              });
            },
            items: [
              Icon(
                Icons.home,
              ),
              Icon(Icons.person),
              Icon(Icons.home),
              Icon(Icons.now_widgets),
              Icon(Icons.home),
            ]),
      ),

    );
  }
}
