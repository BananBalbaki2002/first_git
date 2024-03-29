import 'package:flutter/material.dart';
import 'package:tasko/components/menu_item.dart';
import 'package:tasko/my_models/status_model.dart';
import 'package:google_fonts/google_fonts.dart';
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
AppBar buildAppBar({var prefixIcon,var onPressedPre,var onPressedSuf,
  required String text,IconData? suffixIcon,Color? color,bool? centerTitle,Colors? colorIcon}) {
  return AppBar(
    elevation: 0,
    centerTitle: centerTitle ==null ? true : centerTitle,
    backgroundColor: color == null ? Colors.transparent: color,
    leading: prefixIcon != null ?GestureDetector(child: Icon(prefixIcon),
    onTap: onPressedPre ,

    ):null,
    title: Text(
      text,
      style: GoogleFonts.chewy(textStyle:const TextStyle(fontWeight: FontWeight.w100,color: appFo,fontSize: 27, letterSpacing: .5))
    ), actions: [
      IconButton(
        icon:
        Icon(suffixIcon, size: 26, color: Colors.white),
        onPressed: onPressedSuf,
      ),
    ],
  );
}
double r=30;
//------------------
const Color appCo=Colors.blue;
const MaterialColor appCol=Colors.blue;
Color pu=Colors.purple;
const MaterialColor pur=Colors.purple;
//const MaterialColor pu=Colors.purple;
const FontWeight fw=FontWeight.bold;
const Color appFo=Colors.white;
const Color myGray=Colors.blueGrey;

String appName ='tracker';
TextStyle style(isHeader)=>TextStyle(
    fontWeight:isHeader? FontWeight.bold:FontWeight.normal,
    color:isHeader?  pu:Colors.black87
);
AppBar trackerBar()=>AppBar(
  backgroundColor: appCo,
  shadowColor: appCo,
  elevation: 0,
);
TextStyle trackerStyle= GoogleFonts.chewy(textStyle:const TextStyle(fontWeight: FontWeight.w100,color: appFo,fontSize: 27, letterSpacing: .5));
//-----------------------------customDropdownMenuItem------------------

DropdownMenuItem<String> kbuildMenuItem(var item) => DropdownMenuItem(
    value: item.toString(),
    child: Text(item.toString())
);

PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
  value: item,
  child: Row(
    children: [
      Icon(
        item.icon,
        color: Colors.purple,
        size: 20,
      ),
      SizedBox(
        width: 12,
      ),
      Text(item.text),
    ],
  ),
);


//-------------------------------