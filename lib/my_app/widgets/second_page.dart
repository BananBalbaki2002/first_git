

import 'package:flutter/material.dart';
import 'package:tasko/controllers/profile_controller.dart';



class SecondPage extends StatelessWidget {
  ProfileController profileController=ProfileController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(

      body: SafeArea(

        child:Center(

child:Container(
    height: size.height*0.3,
    width: double.infinity,
    margin: EdgeInsets.all(size.width*0.025),
    padding: EdgeInsets.all(size.width*0.025),
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(size.width*0.025),

        image: profileController.profileobj!.img_profile != null ? DecorationImage(
          //image:Image
            image:AssetImage('${profileController.profileobj!.img_profile}'),
            fit: BoxFit.contain
        ) : null



    ))


        ),



      ),


    );
  }
}
