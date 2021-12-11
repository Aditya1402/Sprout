// SUB-HEADING

// Pass Value: String
// Alignment: Center
// Font Size: 20


//******************************************************************************
 
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_sprout/model_classes/colours.dart';

class SubHead extends StatelessWidget {
  String text;
  TextAlign? alignment;
  SubHead(this.text,[this.alignment]);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(

        // Customize Here
        color: Shade.t2,
        fontSize: 19.sp,
        fontWeight: FontWeight.w700
      ),
      textScaleFactor: 1.1,
    );
  }
}