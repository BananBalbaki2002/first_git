import 'package:flutter/material.dart';

import '../constants.dart';

class ReTextField extends StatefulWidget {
  String? hintText;
  String?labelText;
  bool enableBorder;

  double? borderRadius;
  TextEditingController controller;

  TextInputType? keyboardType;
  bool isPassword;
  Widget? prefixIcon;
  bool unVisable = true;

  ReTextField({
    this.hintText,
    this.labelText,

    this.borderRadius,
    required this.controller,
    required this.isPassword,
    required this.enableBorder,
    this.keyboardType,
    this.prefixIcon,
  });

  @override
  State<ReTextField> createState() => _ReTextFieldState();
}

class _ReTextFieldState extends State<ReTextField> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Container(
        //margin: EdgeInsets.only(top: 7),
        //padding: EdgeInsets.symmetric(
          //  horizontal: 8,
           // vertical: 5
        //),
        //height: MediaQuery.of(context).size.height * 0.069,
        decoration: BoxDecoration(

          color: Colors.grey[100],
        //  borderRadius: BorderRadius.circular(8),






          borderRadius: BorderRadius.circular(widget.borderRadius??8),
          border:widget.enableBorder? Border.all(color: Colors.black12, width: 1.5):null,
        ),
        child: TextFormField(

          cursorColor: Colors.indigo,
          //cursorHeight: 30,
          obscureText: widget.isPassword ? widget.unVisable : false,
          keyboardType: widget.keyboardType,
          autofocus: false,

          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(


),
/*
            labelText: widget.labelText ,
            labelStyle:  TextStyle(
             // color: Colors.grey[600],
              fontSize: size.width*0.036,

            ),

*/
            hintText: widget.hintText,
            hintStyle: TextStyle(
             // color: Colors.grey[600],
              fontSize: size.width*0.037,

              color: Colors.grey[500],

            ),

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
            //border: InputBorder.none,
          ),
        ),);





  }
}
class MyInput extends StatelessWidget {
  MyInput({
    required this.widget,
    required this.title,
  });

  Widget widget;
  String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Container(
        margin: EdgeInsets.only(top: 20),
        child:
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(

                  fontWeight: FontWeight.w500,
                //  fontSize: size.width*0.05,
                  color:Colors.grey[700],
                    fontSize:16,
                ),
              ),
              SizedBox(height: 5,),
              widget
            ]));
  }
}