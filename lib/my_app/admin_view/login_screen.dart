import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tasko/components/custom_button.dart';
import 'package:tasko/components/custom_field.dart';
import 'package:tasko/controllers/login_controller.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/controllers/user_controller.dart';
import 'package:tasko/my_models/user_model.dart';
import 'package:tasko/services/auth_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../constants.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  LoginController loginController = LoginController();
  TaskController  taskController=TaskController();
UserController  userController=UserController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Container(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.04,
                        vertical: size.width * 0.06),
                    child: Form(
                      key: formKey,
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

                        SizedBox(
                          height: 28,
                        ),
                        CustomField(
                            validator: (title)=> title !=null && title.isEmpty ? ' Cannot be empty ':null ,

                            height: 65,
                            hintColor: Colors.grey[700],
                            allBorder: false,
                            hintText: 'Employee_identical',
                            labelText: 'Employee_identical',
                            colorField: Colors.grey.withAlpha(53),
                            isPassword: false,
                            controller: loginController.idController),
                        SizedBox(
                          height: 18,
                        ),
                        CustomField(
                            validator: (title)=> title !=null && title.isEmpty ? 'Title Cannot be empty ':null ,

                            allBorder: false,
                            hintColor: Colors.grey[700],
                            height: 65,
                            hintText: 'Password',
                            labelText: 'Password',
                            isPassword: true,
                            colorField: Colors.grey.withAlpha(53),
                            controller: loginController.passwordController),
                        SizedBox(
                          height: 26,
                        ),

                        CustomButton(
                          height: 63,

                          width: size.width*0.9, buttonName: 'LOGIN',

                          onTap:
                              () async {
                                final isValid = formKey.currentState!
                                    .validate();
// if found title
                                if (isValid == true) {
                                  EasyLoading.show(status: 'Loading....');

                                  await loginController.onClickLogin();

                                  if (loginController.modelUser != null) {
                                    EasyLoading.showSuccess('sing up is done.');


                                    await GetStorage().write('role_id',
                                        loginController.modelUser!.role_id);
                                    int role_id = await GetStorage().read(
                                        'role_id');
                                    if (role_id == 1) {
                                      print('1');
                                      Navigator.pushReplacementNamed(
                                          context, '/Dashboard');
                                    }
                                    else if (role_id == 2) {
                                      print('2');
                                      Navigator.pushReplacementNamed(
                                          context, '/DashboardTeamLeader');
                                    }


                                    else if (role_id == 3) {
                                      print('2');
                                      Navigator.pushReplacementNamed(
                                          context, '/DashboardMember');
                                    }


                                    print('yes every things');
                                  } else {
                                    EasyLoading.showError(
                                      'error page',
                                    );
                                    print('there are errors ');
                                  }
                                }



                              }

                        ),






                      ]),
                    )))));
  }
}



/*


   GestureDetector(
                          onTap: () async {
                            EasyLoading.show(status: 'Loading....');
                            //FocusScope.of(context).unfocus();
                            await loginController.onClickLogin();

                            if (loginController.modelUser != null) {
                              EasyLoading.showSuccess('sing up is done.');
                              Navigator.pushReplacementNamed(
                                  context, '/Dashboard');
                              print('yes every things');
                            } else {
                              EasyLoading.showError(
                                'error page',
                              );
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

 */
