import 'package:flutter/material.dart';
import 'package:tasko/services/user_service.dart';
import 'package:tasko/my_models/user_model.dart';

class UserController {
//------------------------addUser------------------------------

  List list_of_User = [];

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController roleIdController = TextEditingController();
  TextEditingController teamIdController = TextEditingController();

  onClickAddUser() async {
    User user = User(
        first_name: fnameController.text,
        last_name: lnameController.text,
        email: emailController.text,
        employee_identical: idController.text,
        password: passwordController.text,
        role_id: roleIdController.text,
        team_id: teamIdController.text);


    await UserService.addUser(user);
  }
}
