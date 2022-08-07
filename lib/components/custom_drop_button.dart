

import 'package:flutter/material.dart';



class CustomDropButton extends StatelessWidget {
var items;
  var  onChange;
IconData icon;
  CustomDropButton({
required this.icon,
   required this.items,
   required this.onChange
});



  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child:   DropdownButton(
        icon:Icon(icon,color:Colors.grey,),
        iconSize: 30,
        elevation: 4,
        items: items,
        onChanged:onChange!()
    ));
  }
}
