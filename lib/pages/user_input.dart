import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_sprout/custom_widgets/header.dart';
import 'package:project_sprout/custom_widgets/sub_header.dart';

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          children: [
            Spacer(),

            SvgPicture.asset('images/svg/chipmunk.svg',width: 150.w,),

            // Text
            

            // TextField
            TextField(),

            Spacer()
          ],
        ),
      ),
    );
  }
}
