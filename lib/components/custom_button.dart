
import 'package:flutter/material.dart';
import 'package:tasko/my_app/constants.dart';

class CustomButton extends StatelessWidget {
  // اذا كان فاينل ما بصير هيئ الو قيمة هون
 final double height,width;
 final double? fontSize;
 final String buttonName;
 final Color? buttonColor,fontColor;
final  Function()  onTap;

 CustomButton({
  required this.height,
  required this.width,
   required this.buttonName,
   required this.onTap,
   this.buttonColor,
   this.fontSize,
   this.fontColor
});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return
      GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            //اذا اجا لون حطو والا تركو ازرق
              color: buttonColor ?? Colors.indigo,
              borderRadius: BorderRadius.circular(12)) ,

          child: Center(
            child: Text(
              buttonName,
              style: TextStyle(
                  color: fontColor ??Colors.white,
                  fontSize:fontSize ?? 20,
                  fontWeight: FontWeight.w500),

            ),
          )

      ),
    );




  }
}
