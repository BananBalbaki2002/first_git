import 'package:flutter/material.dart';
import 'package:tasko/my_models/model_role.dart';
import 'package:tasko/services/role_service.dart';
import 'package:tasko/services/user_service.dart';
import 'package:tasko/my_models/user_model.dart';

class UserController  with  ChangeNotifier {
//------------------------addUser------------------------------

  List<User> list_of_Users = [];
  //update res
  int id_user = 0;
int? selectedIdTeam;
int? selectedIdRole;
  var addedUser;
  var edit_User;
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  //--------------AddUser---------------------

  Future   onClickAddUser() async {
    User user = User(
        first_name: fnameController.text,
        last_name: lnameController.text,
        email: emailController.text,
        employee_identical: idController.text,
        password: passwordController.text,
        role_id: selectedIdRole.toString(),
        team_id:selectedIdTeam.toString()

    );

    print( fnameController.text);
    print( lnameController.text);
    print( emailController.text);
    print(  idController.text);
    print(  passwordController.text);
    print( selectedIdRole.toString());
    print( selectedIdTeam.toString());

    addedUser=await UserService.addUser(user);
    list_of_Users.add(addedUser);
    notifyListeners();
print('yes');




  }
//--------------EditeUser---------------------

  onClickEditUser() async {
print(id_user);
    User user = User(
        first_name: fnameController.text,
        last_name: lnameController.text,
        email: emailController.text,
        employee_identical: idController.text,
        password: passwordController.text,
        role_id: selectedIdRole.toString(),
        team_id: selectedIdTeam.toString()
    );
print( fnameController.text);
print( lnameController.text);
print( emailController.text);
print(  idController.text);
print(  passwordController.text);
print( selectedIdRole.toString());
print( selectedIdTeam.toString());

edit_User=await UserService.editUser(user, id_user);
for(var us in list_of_Users){
  if(us.id == id_user){
    us=edit_User;
    notifyListeners();
    //notifyListeners();
    break;
  }
}





  }

//--------------DeleteUser---------------------

  onClickDeleteUser() async {

    print(id_user);

    await UserService.deleteUser(id_user);
    //int index,int id
    for (var us in list_of_Users) {
      if (us.id == id_user) {
        list_of_Users.remove(us);
        notifyListeners();
        break;
      }
    }

  }


//---------------------ShowAllUsers---------------

  Future<List<User>> onClickShowAllUser() async {

    await fetchRoles();
    list_of_Users = await UserService.servAllUsaer();

    return list_of_Users;

  }
//-----------------showOneUser---------
  var im;
  Future<User> onClickShowUser(var id) async {

    im= await UserService.servAUser(id);

    return im;
  }

  Map<dynamic,String> c_idMapRole={};
  Map<String,int> c_nameMapRole={};
  List<String> list_Name_Roles=[];
  //----------------------fetchRoles--------------
  Future<List<RoleModel>> fetchRoles() async
  {
    var h;
    h =await RoleService.ShowAllRole();
    //map[id]=name

    c_idMapRole=await RoleService.idMapRole;
    print( c_idMapRole);
    //list of name states tasks
    list_Name_Roles=await RoleService.name_Roles;


    c_nameMapRole=await RoleService.nameMapRole;
    // return all obj status
    return h;
  }






}





