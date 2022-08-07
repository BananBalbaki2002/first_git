import 'package:flutter/material.dart';

const Color  kred=Color(0xff992149);
const Color korange=Color(0xfffa4c4c);
const Color kblack=Color(0xff211e1f);

const Color kpurple=Color(0xff2b2024);
const Color kblue=Color(0xff0D47A1);

const Color kBackgroundColor=Color(0xFFF1EEF1);
const Color kcolorApp=Colors.indigo;
const double kDefaultPadding=20.0;
const kDefaultShadow=BoxShadow(
  offset: Offset(0,15),
  blurRadius: 27,
  color:Colors.black12

);
//---------------------------CustomAppBar------------------------------
AppBar buildAppBar({IconData? prefixIcon,var onPressedPre,var onPressedSuf,required double fontsize ,required String text,required IconData suffixIcon}) {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    leading: prefixIcon == null ?Container():GestureDetector(child: Icon(prefixIcon),
    onTap: onPressedPre ,

    ),
    title: Text(
      text,
      style: TextStyle(
          color: Colors.white, fontSize: fontsize, fontWeight: FontWeight.bold),
    ),
    actions: [
      IconButton(
        icon:
        Icon(suffixIcon, size: 28, color: Colors.white),
        onPressed: onPressedSuf,
      ),
    ],
  );
}

//-----------------------------customDropdownMenuItem------------------

DropdownMenuItem<String> kbuildMenuItem(var item) => DropdownMenuItem(
    value: item.toString(),
    child: Text(item.toString())
);

//-------------------------------