import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/get_started.dart';

class Skip extends StatelessWidget {
  const Skip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: Duration(seconds: 1),
      child: Container(
        alignment: Alignment.centerRight,
        child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () => Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: GetStarted())),
          child: Text(
            'Skip',
            style: TextStyle(
              color: Shade.smoke,
              fontWeight: FontWeight.w700,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
