// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_sprout/pages/get_started.dart';
import 'package:project_sprout/pages/loading.dart';
import 'package:project_sprout/pages/reminder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 
  
  @override
  Widget build(BuildContext context) {

    // Checking the orientation of device

    return ScreenUtilInit(
      builder: () => MaterialApp(
        routes: {
          '/reminder' : (context) => Reminder(),
        },
          //////////////////// METADATA HERE ////////////////////

          title: 'Sprout',
          theme: ThemeData(
            brightness: Brightness.light,
            fontFamily: 'MuseoSansRounded',
          ),

          //////////////////// METADATA ENDS HERE ////////////////////

          home: Loading()),
          
      designSize: const Size(414, 896),
      
    );
  }
}
