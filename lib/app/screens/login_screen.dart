import 'package:flutter/material.dart';
import 'package:tasko/app/reusable/text_field.dart';

import '../constants.dart';


class Login extends StatelessWidget {
  TextEditingController nameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController idController=TextEditingController();

  GlobalKey<FormState> formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(

              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: size.width*0.04, vertical:size.width*0.05),
                child: ListView(

                    children: [
                      Row(children: [IconButton(onPressed: (){
                        Navigator.pop(context, );

                      }, icon: Icon(Icons.arrow_back_ios_outlined),iconSize: 25,color: Colors.black,),
                        SizedBox(width: size.width*0.09,),
                        Text(

                          'Welcome To Tasko',
                          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),

                        ),


                      ],),
//SizedBox(height: 40,),

                      Image.asset('images/second.png'),
                      SizedBox(height: size.height*0.01,),
                      ReTextField(hintText: 'UserName',isPassword: false,controller: nameController,),
                      ReTextField(hintText: 'Password',isPassword: true,controller: passwordController,),

                      ReTextField(hintText: 'ID',isPassword: false,controller: idController,),
                      SizedBox(
                        height: 18,
                      ),
                      GestureDetector(onTap: (){

                        Navigator.pushReplacementNamed(context, '/Dashboard');


                      },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            decoration: BoxDecoration(
                                color: kblue,
                                borderRadius: BorderRadius.circular(12)),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Center(
                                  child: Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
            )
        )
    );
  }
}


