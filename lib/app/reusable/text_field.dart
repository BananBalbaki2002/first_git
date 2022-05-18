import 'package:flutter/material.dart';

import '../constants.dart';

class ReTextField extends StatefulWidget {
  String? hintText;
  bool isPassword;
  Widget? prefixIcon;
  bool unVisable = true;
  double? borderRadius;
  TextEditingController controller;
  TextInputType? keyboardType;

  ReTextField({
    this.hintText,
    this.borderRadius,
    required this.controller,
    required this.isPassword,
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
    return Container(
      margin: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(widget.borderRadius  ?? 8)
      ),
      height: size.height * 0.07,
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.02),
        child: TextFormField(
          cursorColor: kblue,
          cursorHeight: 20,
          controller: widget.controller,
          obscureText: widget.isPassword ? widget.unVisable : false,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
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
                    : Icons.visibility_off))
                : null,
            hintText: widget.hintText,
            hintStyle: TextStyle(fontSize: 20),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
