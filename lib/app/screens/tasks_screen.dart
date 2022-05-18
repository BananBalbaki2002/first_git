import 'package:flutter/material.dart';
import 'package:tasko/app/reusable/text_field.dart';
import 'package:tasko/app/models/mod_tasks.dart';
import 'package:tasko/app/widgets/card_task.dart';
import '../constants.dart';


class Task extends StatelessWidget {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Stack(
        children: [
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: kblue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.width*0.14),
                  bottomRight: Radius.circular(size.width*0.14)),
            ),
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Column(children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.menu, size: 27, color: Colors.white),
                      ),
                      Text(
                        'Tasks',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.notifications_outlined,
                            size: 28, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width*0.07,
                  ),

                  ReTextField(hintText: 'Search',isPassword: false,borderRadius: 40,controller:searchController ,prefixIcon: Icon(Icons.search),)


                  ,SizedBox(
                    height: size.width*0.06,
                  ),
                  Expanded(
                      child: ListView.builder(
                        itemCount: dataTasks.dataT.length,
                        itemBuilder: (context, index) => Padding(
                          padding:  EdgeInsets.symmetric(vertical:  size.width*0.023,horizontal: size.width*0.028),
                          child: cardTask(index: index),
                        ),
                      ))
                ]),
              )),
        ],
      ),

    );
  }
}






