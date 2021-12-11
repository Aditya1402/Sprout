// ANIMATED BUTTON

// Pass Value: String & Color objects
// Font Size: 18 scale-factor


//******************************************************************************


import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Button extends StatelessWidget {
  String text;
  Color buttonColor;
  Button(this.text,this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return AnimatedButton(
        color: buttonColor,
        width: 354.w, 
        height: 60,
        onPressed: () {}, 
        child: Text(text,
        style: TextStyle(
          fontSize: 18.sp,
          color: Colors.white,
          fontWeight: FontWeight.w900
        ),
        textScaleFactor: 1.1,));
  }
}
