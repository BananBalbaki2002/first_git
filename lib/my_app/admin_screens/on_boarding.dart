

import 'package:flutter/material.dart';

import '../constants.dart';
class OnBarding extends StatelessWidget {
  const OnBarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.03, vertical:size.width*0.03),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height*0.09,),
              Text(
                'Tasko',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(height: size.height*0.02,),
              Image.asset('images/first.png'),
              SizedBox(height: size.height*0.03,),
              Text(
                'The Greate Idea ',
                style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
              ),
              Text(
                  "Working with experience team make "
                      "work easier & get closer to Goals."
                  ,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),





            ],
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(backgroundColor:Colors.blue,onPressed: (){
        Navigator.pushNamed(context, '/login');

      },child: Icon(Icons.arrow_forward_outlined),),
    );
  }
}
