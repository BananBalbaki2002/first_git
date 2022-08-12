import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tasko/components/custom_field.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/controllers/user_controller.dart';


import 'add_user.dart';



class EditUser extends StatefulWidget {

  //UserController userController=UserController();
  TaskController   taskController=TaskController();
 // TeamController  teamController= TeamController();

  List<int> RoleIdList = [2,3];
  List<int> teamIdList = [1,2,3];


  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    var model= Provider.of<UserController>(context,listen: false);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    GestureDetector(
                      onTap: (){

                        Navigator.of(context).pop();

                      },


                      child:Icon(Icons.arrow_back,
                        color: Colors.white,size: 25,)


                    ),

                    Text(
                      'EditUser',
                      style: TextStyle(color: Colors.white, fontSize: 27),
                    ),
                    SizedBox(

                    ),

                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: 10,
                          ),
                          //---------fname-------------------------------------
                          InputField(widget: CustomField(
                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'First_Name',
                            hintColor: Colors.grey[700],
                            isPassword: false,
                            controller: model.fnameController,colorField: Colors.grey[100],)


                              , title: 'First_Name'),

                          InputField(widget: CustomField(height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'Last_Name', isPassword: false,
                            controller: model.lnameController,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                              , title: 'Last_Name'),


                          InputField(widget: CustomField(keyboard:TextInputType.emailAddress,
                            height: MediaQuery.of(context).size.height * 0.07, allBorder:true,
                            hintText:'Email', isPassword: false,
                            hintColor: Colors.grey[700],
                            controller: model.emailController,colorField: Colors.grey[100],)
                              , title: 'Email'),

                          InputField(widget: CustomField(keyboard:TextInputType.visiblePassword,
                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'Password', isPassword: true,
                            controller: model.passwordController,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                              , title: 'Password'),


                          InputField(widget: CustomField(keyboard:TextInputType.number,
                            height: MediaQuery.of(context).size.height * 0.07, allBorder:true,
                            hintText:'Employee_Identical', isPassword: false,
                            hintColor: Colors.grey[700],
                            controller: model.idController,colorField: Colors.grey[100],)
                              , title: 'Employee_Identical'),



                          InputField(
                            title: 'Role_Id',
                            widget:  Container(
                              margin: EdgeInsets.only(top: 7),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black12, width: 1.5),
                              ),
                              child:DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint:Text( 'select role_Id '),

                                  items: widget.RoleIdList.map(buildMenuItem).toList(),
                                  value:model.choosRoleId ,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  onChanged: (value)=>

                                      setState(() {
                                        model.choosRoleId=value as String?;
                                      }),
                                ),
                              ),
                            ),
                          ),


                          //-------team_id-------

                          InputField(
                            title: 'Team_Id',
                            widget:

                            Container(
                              margin: EdgeInsets.only(top: 7),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              height: MediaQuery.of(context).size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[100],
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.black12, width: 1.5),
                              ),
                              child:DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint:Text( 'select Team_id '),
                                  items: widget.teamIdList.map(buildMenuItem).toList(),
                                  value:model.choosteamId ,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  onChanged: (value)=>

                                      setState(() {
                                        model.choosteamId=value as String?;
                                      }),
                                ),
                              ),
                            ),
                          ),




                        ]


                        ),
                      )
                  ),
                ),
              ),





            ]),

      ),

      floatingActionButton: FloatingActionButton(backgroundColor:Colors.blue,onPressed: ()async{

print(model.id_user);

        EasyLoading.show(status: 'loading...');
        await model.onClickEditUser();

        if(model.edit_User != null){
          EasyLoading.showSuccess('new user is edited');
          Navigator.of(context).pop();


        }
        else {
          EasyLoading.showError('can not edit ');
        }





      },child: Icon(Icons.check_outlined),) ,

    );
  }
}

DropdownMenuItem<String> buildMenuItem(int item) => DropdownMenuItem(
    value: item.toString(),
    child: Text(item.toString())
);


