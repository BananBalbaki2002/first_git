
import 'package:flutter/material.dart';

class CustomField extends StatefulWidget {
final Color? colorField;
final String hintText;
final String? labelText;
final  TextInputType? keyboard;
final double? height;
final  TextEditingController controller;
Widget? prefixIcon;
 final bool isPassword;
 final bool allBorder;
 final Color? hintColor;
 final double? borderRadius;

bool unVisable = true;

CustomField({

  this.borderRadius,
   this.height,
  this.hintColor,
  this.labelText,
  required this.allBorder,
  required this.hintText,
  required this.isPassword,
  required this.controller,
  this.keyboard,
  this.colorField,
  this.prefixIcon



});

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(

height: widget.height,
      decoration: BoxDecoration(
        color:widget.colorField ?? Colors.grey[200],
        borderRadius: BorderRadius.circular(widget.borderRadius??8),
        border:widget.allBorder ? Border.all(color: Colors.black12, width: 1.5)
        :
        Border(
          top:BorderSide(color:Colors.white.withAlpha(30),width: 2),
         right:BorderSide(color:Colors.white.withAlpha(30),width: 2),
          left:BorderSide(color:Colors.white.withAlpha(30),width: 2),
          bottom:BorderSide(color:Colors.white.withAlpha(30),width: 2),

        ),

      ),

      child:   Center(
        child: TextFormField(
          controller:widget.controller ,
          obscureText: widget.isPassword ? widget.unVisable : false,
          cursorColor: Colors.indigo,
          keyboardType: widget.keyboard ?? TextInputType.text,
          style: TextStyle(
           color:Colors.grey[800],
            fontSize: 18,


          ),
          decoration: InputDecoration(
          border: InputBorder.none,

            hintText:widget.hintText,
            labelText:widget.labelText,
            labelStyle:TextStyle(
              fontSize: 18,

            ),
            hintStyle: TextStyle(
              fontSize: 16,
              color: widget.hintColor ?? Colors.grey[500],
              //fontFamily: 'Acaslon Reqular',

            ),
            //المسافة بين النص وحواف الفيلد
            contentPadding: EdgeInsets.fromLTRB(13, 8, 8,8),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.isPassword
                ? IconButton(
                onPressed: () {
                  setState(() {
                    widget.unVisable = !widget.unVisable;
                  });
                },
                icon: Icon(widget.unVisable
                    ? Icons.visibility
                    : Icons.visibility_off, color: Colors.grey[600],size:size.width*0.050,))
                : null,


          ),




        ),
      ),
    );




  }
}
