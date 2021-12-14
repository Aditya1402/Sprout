import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model_classes/colours.dart';

class CustomAppBar extends StatelessWidget {
  @override
  String appTitle;
  CustomAppBar(this.appTitle);

  Widget build(BuildContext context) {
    return AppBar(
      // Removing AppBar Back Button
      automaticallyImplyLeading: false,
      centerTitle: true,

      // Bottom Border
      bottom: PreferredSize(
        child: Container(
          color: Shade.t4,
          height: 3.h,
        ),
        preferredSize: Size.fromHeight(1.5.h),
      ),

      // Color
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        appTitle,
        style: TextStyle(
          color: Shade.t1,
          fontSize: 18.sp),
      ),

      
      
    );
  }
}
