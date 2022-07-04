import 'package:flutter/material.dart';
import 'package:tasko/controllers/user_controller.dart';

class AddUser extends StatefulWidget {


  UserController userController=UserController();





  List<int> itemsList = [2,3];
  List<int> teamIdList = [1];
  String? choositem;

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {


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
                        'AddUser',
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
                            InputField(
                              title: 'First_Name',
                              widget: TextFormField(
                                autofocus: false,
                                controller: widget.userController.lnameController,
                                // keyboardType: keyboardType,
                                decoration: InputDecoration(
                                  hintText: 'First_Name',

                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),

                            //---------fname-------------------------------------
                            InputField(
                              title: 'Last_Name',
                              widget: TextFormField(
                                autofocus: false,
                                controller: widget.userController.lnameController,
                                // keyboardType: keyboardType,
                                decoration: InputDecoration(
                                  hintText: 'Last_Name',

                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            //-------password----------
                            InputField(
                              title: 'Password',
                              widget: TextFormField(
                                autofocus: false,
                                controller: widget.userController.passwordController,
                                // keyboardType: keyboardType,
                                decoration: InputDecoration(
                                  hintText: 'password',

                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            //-----email---------
                            InputField(
                              title: 'Email',
                              widget: TextFormField(
                                autofocus: false,
                                controller: widget.userController.emailController,
                                // keyboardType: keyboardType,
                                decoration: InputDecoration(
                                  hintText: 'Email',

                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                            //-----id---------
                            InputField(
                              title: 'ID',
                              widget: TextFormField(
                                autofocus: false,
                                controller: widget.userController.idController,
                                // keyboardType: keyboardType,
                                decoration: InputDecoration(
                                  hintText: 'Employee_identical',

                                  hintStyle: TextStyle(
                                    color: Colors.grey[500],
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),


                            InputField(
                              title: 'Role_Id',
                              widget:  DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint:Text( 'select role '),
                                  items: widget.itemsList.map(buildMenuItem).toList(),
                                  value:widget.choositem ,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  onChanged: (value)=>

                                      setState(() {
                                        widget.choositem=value as String?;
                                      }),
                                ),
                              ),
                            ),


                            //-------team_id-------

                            InputField(
                              title: 'Team_Id',
                              widget:  DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  hint:Text( 'select Team_id '),
                                  items: widget.teamIdList.map(buildMenuItem).toList(),
                                  value:widget.choositem ,
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  iconSize: 30,
                                  isExpanded: true,
                                  onChanged: (value)=>

                                      setState(() {
                                        widget.choositem=value as String?;
                                      }),
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

class InputField extends StatelessWidget {
  InputField({
    required this.widget,
    required this.title,
  });

  Widget widget;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16,),
          ),
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
              child: widget)
        ],
      ),
    );
  }
}



DropdownMenuItem<String> buildMenuItem(int item) => DropdownMenuItem(
  value: item.toString(),
  child: Text(item.toString())
);

