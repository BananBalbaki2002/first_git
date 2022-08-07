import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasko/components/custom_field.dart';
import 'package:tasko/components/custom_search_box.dart';
import 'package:tasko/controllers/task_controller.dart';
import 'package:tasko/components/card_task.dart';

import 'package:tasko/my_models/task_model.dart';

import '../constants.dart';

class TaskScreen extends StatefulWidget {
  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  TextEditingController searchController = TextEditingController();

  int selected = 0;
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var taskController=Provider.of< TaskController >(context);
    return Scaffold(
      backgroundColor: kcolorApp,
      appBar: buildAppBar(text:'Tasks',fontsize:30,suffixIcon:Icons.notifications_outlined),
      body: Column(

        children: [
          SearchBox(),
          Categoriess(
            selected: selected,
            callBack: (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            },
          ),
          SizedBox(
            height: kDefaultPadding / 2,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  margin:EdgeInsets.only(top:60),
                  decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),


                taskList(
                    selected: selected,
                    callBack: (int index){
                      setState(() {
                        selected =index;

                      });
                    },
                    pageController: pageController, taskController: taskController)




                ,

              ],
            ),

          )
        ],
      ),

      floatingActionButton: FloatingActionButton(backgroundColor:Colors.indigo,
        onPressed: ()async{

//Provider.of<UserController>(context,listen:false).onClickAddUser();



        },child: Icon(Icons.add),) ,

    );
  }


}

class taskList extends StatelessWidget {
  int selected;
  Function callBack;
  PageController pageController;
  TaskController taskController;

  taskList({required this.selected,required this.callBack,
    required this.pageController,required this.taskController});




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var category=taskController.menu.keys.toList();
    return  Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child:PageView(
            controller: pageController,
            onPageChanged: (index) => callBack(index),
            children:
            [ FutureBuilder< List<Task> >(
              future:taskController.menu[category[selected]]!,
              builder: (context,snapShot){ //AsyncSnapShot
                if(snapShot.hasData)
                  return

                    ListView.builder(
                      itemCount: snapShot.data!.length,
                      itemBuilder: (context, index) => Padding(
                        padding:  EdgeInsets.symmetric(vertical:  size.width*0.023,),
                        child:



                        cardTask(item:snapShot.data![index]),
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
            ) ]

        )


    );
  }
}



class Categoriess extends StatelessWidget {
  int selected;
  Function callBack;
  Categoriess({required this.selected, required this.callBack});

  List<String> categories = ["All", "Completed", "Missed", "Progress"];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        height: 30,
        child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => callBack(index),
              child: Container(
                  alignment: Alignment.center,
                  padding:
                  EdgeInsets.symmetric(horizontal: kDefaultPadding),
                  margin: EdgeInsets.only(
                      left: kDefaultPadding,
                      right: index == categories.length - 1
                          ? kDefaultPadding
                          : 0),
                  decoration: BoxDecoration(
                    color: index == selected
                        ? Colors.white.withOpacity(0.4)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    categories[index],
                    style: TextStyle(color: Colors.white),
                  )),
            )));
  }
}
