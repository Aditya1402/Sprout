// HEADING

// Pass Value: String
// Alignment: Center
// Font Size: 30


//******************************************************************************
 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_sprout/model_classes/colours.dart';

class Head extends StatelessWidget {
  String text;
  TextAlign? alignment;
  Head(this.text,[this.alignment]);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(

        // Customize Here
        color: Color(0xff323232),
        fontSize: 30.sp,
        fontWeight: FontWeight.w900
      ),
      textScaleFactor: 1.1,
    );
  }
}
