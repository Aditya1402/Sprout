import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_sprout/pages/get_started.dart';

class Loading extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 6),
        () => Navigator.pushReplacement(
            context, PageTransition(type: PageTransitionType.leftToRight, child: GetStarted())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LottieBuilder.asset('images/lotties/l2.json',width: 150.w,),
      ),
    );
  }
}
