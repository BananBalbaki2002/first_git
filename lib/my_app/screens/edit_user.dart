import 'package:flutter/material.dart';
import 'package:tasko/components/custom_field.dart';
import 'package:tasko/controllers/user_controller.dart';


import 'add_user.dart';



class EditUser extends StatefulWidget {


  List<int> RoleIdList = [2,3,4];
  List<int> teamIdList = [1,2,3];
  String? choosRoleId;
  String? choosteamId;

  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: SafeArea(
        child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.white12,
                        child: Icon(Icons.arrow_back_ios_outlined,
                          color: Colors.white,size: 20,)),

                    Text(
                      'EditUser',
                      style: TextStyle(color: Colors.white, fontSize: 28),
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
                            controller: widget.fnameController,colorField: Colors.grey[100],)


                              , title: 'First_Name'),

                          InputField(widget: CustomField(height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'Last_Name', isPassword: false,
                            controller: widget.lnameController,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                              , title: 'Last_Name'),


                          InputField(widget: CustomField(keyboard:TextInputType.emailAddress,
                            height: MediaQuery.of(context).size.height * 0.07, allBorder:true,
                            hintText:'Email', isPassword: false,
                            hintColor: Colors.grey[700],
                            controller: widget.emailController,colorField: Colors.grey[100],)
                              , title: 'Email'),

                          InputField(widget: CustomField(keyboard:TextInputType.visiblePassword,
                            height: MediaQuery.of(context).size.height * 0.07,
                            allBorder:true,hintText:'Password', isPassword: true,
                            controller: widget.passwordController,
                            hintColor: Colors.grey[700],
                            colorField: Colors.grey[100],)
                              , title: 'Password'),


                          InputField(widget: CustomField(keyboard:TextInputType.number,
                            height: MediaQuery.of(context).size.height * 0.07, allBorder:true,
                            hintText:'Employee_Identical', isPassword: false,
                            hintColor: Colors.grey[700],
                            controller: widget.idController,colorField: Colors.grey[100],)
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
                                  value:widget.choosRoleId ,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  onChanged: (value)=>

                                      setState(() {
                                        widget.choosRoleId=value as String?;
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
                                  value:widget.choosteamId ,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  onChanged: (value)=>

                                      setState(() {
                                        widget.choosteamId=value as String?;
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

      floatingActionButton: FloatingActionButton(backgroundColor:Colors.indigo,onPressed: (){


      },child: Icon(Icons.check_outlined),) ,

    );
  }
}

DropdownMenuItem<String> buildMenuItem(int item) => DropdownMenuItem(
    value: item.toString(),
    child: Text(item.toString())
);


