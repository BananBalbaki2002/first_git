import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:tasko/components/custom_drop_button.dart';
import 'package:tasko/components/custom_field.dart';
import 'package:tasko/my_app/models/model_user.dart';
import 'package:tasko/controllers/user_controller.dart';
import 'package:tasko/components/menu_item.dart';
import 'package:tasko/my_models/user_model.dart';
import 'package:tasko/services/user_service.dart';
import '../constants.dart';



class LUsers extends StatefulWidget {
  List<String> itemsList = ['Edit', 'Delete'];
  //UserController userController = UserController();

  TextEditingController searchController = TextEditingController();

  @override
  State<LUsers> createState() => _LUsersState();
}

class _LUsersState extends State<LUsers> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Stack(children: [
          Container(
//height: size.height * 0.3,
            color: Colors.blue,
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 9.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {

                            Navigator.pop(context);

                          },
                          icon: Icon(Icons.arrow_back_outlined,
                              size: 27, color: Colors.white),
                        ),
                        Text(
                          'AllUser',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                        //Spacer(),
                        IconButton(
                          icon: Icon(Icons.notifications_outlined,
                              size: 27, color: Colors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.width * 0.06,
                    ),

                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 15.0, right: 15, bottom: 15),
                          child:



                          Consumer<UserController>(
                              builder: (context, userController, child) {
                                return


                                  FutureBuilder<List<User>>(
                                    future: userController.onClickShowAllUser(),
                                    builder: (context, snapShot) {
                                      //AsyncSnapShot
                                      if (snapShot.hasData)
                                        return ListView.builder(
                                          itemCount: snapShot.data!.length,
                                          itemBuilder: (context, index) => Padding(
                                            padding: EdgeInsets.only(bottom: 20.0),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                    radius: 30,
                                                    backgroundImage: NetworkImage(
                                                      // DataUser.dataUs[index].Img
                                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRH6Uyi30Ty2WkMb0ZjuFLoXmkRwrrMObm-X2zztWtGbOgyA-i7mFzuiSKltN14HLAJDVM&usqp=CAU',
                                                    )),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Expanded(
                                                  child: Row(


                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.start,
                                                          children: [

                                                            Row(
                                                              children: [
                                                                Text(
                                                                    '${snapShot.data![index].first_name}'),
                                                                SizedBox(
                                                                  width: 2,
                                                                ),
                                                                Text(
                                                                    '${snapShot.data![index].last_name}'),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 3,
                                                            ),
                                                            Text(
                                                              //DataUser.dataUs[index].email
                                                                '${snapShot.data![index].email}'),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        width: 18,
                                                      ),
                                                      Text(//DataUser.dataUs[index].role

                                                          snapShot.data![index].role_id == 2
                                                              ? 'Leader '
                                                              : 'Member'),
                                                      SizedBox(
                                                        width: 30,
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );

                                      if(snapShot.hasError)
                                        return Center(
                                          child: Text(snapShot.error.toString()),
                                        );
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    },
                                  );
                              }),
                        ),
                      ),
                    ),
                  ],
                ),
              )),

        ]));
  }

// to build every item


}
