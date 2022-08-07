
import 'package:flutter/material.dart';

class CardSubTask extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return
      Container(
        height: 120,
        //  width: 250,
        margin:
        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              // color: Colors.red,
              color: Colors.black12,
              offset: Offset(-1, -1),
              spreadRadius: 2,
              blurRadius: 2,
            )
          ],
        ),
        child:


        Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                  20
              ),
              color: Colors.white,
            ),
            margin: EdgeInsets.only(left: 6),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text('In progress',style: TextStyle(
                          fontWeight: FontWeight.bold,color:Colors.blue),)
                      , SizedBox(
                        height: 10,
                      ),
                      Text(
                        'HR Manager\'s Day',
                        style: TextStyle(
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'This is description about sub task',
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          Row(children: [
                            Icon(Icons.calendar_today_outlined,
                                color:Colors.blue,
                                size: 13),
                            SizedBox(
                              width: 7,
                            ),
                            Text(
                              '20 Sep 2020',
                              style: TextStyle(fontWeight: FontWeight.w500,
                                  fontSize: 13,color:Colors.blue),
                            ),

                          ],)
                        ],
                      )
                    ],
                  ),
                ),

              ],
            )),
      );
  }
}