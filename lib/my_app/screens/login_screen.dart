import 'package:flutter/material.dart';
import 'package:tasko/controllers/login_controller.dart';
import 'package:tasko/my_app/reusable/text_field.dart';
import 'package:tasko/my_models/user_model.dart';
import 'package:tasko/services/auth_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../constants.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
GlobalKey<FormState> formKey= GlobalKey<FormState>();
LoginController  loginController= LoginController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
     Scaffold(body: SafeArea(child:

     Container(
              child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.width * 0.06),
                  child: Form(
                    key:formKey,
                    child: ListView(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(
                                context,
                              );
                            },
                            icon: Icon(Icons.arrow_back_ios_outlined),
                            iconSize: 23,
                            color: Colors.black,
                          ),

                          Text(
                            'Welcome To Tasko',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Image.asset('images/second.png'),



                      MyInput(
                        widget:  ReTextField(
                          enableBorder: false,
                          //controller: passwordController,
                          controller: loginController.passwordController,
                          isPassword: true,
                          hintText: 'Password',
                          labelText:'Password',
                        ),
                        title: 'Password',
                      ),

                    MyInput(widget:  ReTextField(
                     enableBorder: false,

                      labelText: 'employee_identical',
                      controller: loginController.idController,
                      isPassword: false,
                      hintText: 'employee_identical',
                    ), title: 'employee_identical'),

                      SizedBox(
                        height: 26,
                      ),
                      GestureDetector(
                        onTap: () async {
                          EasyLoading.show(status: 'Loading....');
                          await loginController.onClickLogin();


                          if (loginController.modelUser != null) {

                           EasyLoading.showSuccess('sing up is done.');
                           Navigator.pushReplacementNamed(context, '/Dashboard');
                            print('yes every things');
                          } else {
                            EasyLoading.showError('error page', );
                            print('there are errors ');
                          }
                        },
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
                                  fontSize: size.width * 0.044,
                                  fontWeight: FontWeight.w500),
                            )),
                          ),
                        ),
                      ),
                    ]),
                  )))));
        }
  }

