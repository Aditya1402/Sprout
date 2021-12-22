import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/pages/get_started.dart';

void main() {
  AwesomeNotifications().initialize(
    'resource://drawable/res_notification_logo',
    [
      NotificationChannel(
        channelKey: 'scheduled_channel',
        channelName: 'Scheduled Notifications',
        defaultColor: Color(0xffcae183),
        locked: true,
        importance: NotificationImportance.High,
        soundSource: 'resource://raw/res_custom_notification',
        channelDescription: 'Scheduled Notifications for Reminder',
      ),
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      //////////////////// THEMING ////////////////////
      
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
          toolbarTextStyle: TextStyle()),
        fontFamily: 'Inter',

      ),

      

      /////////////////////////////////////////////////
      home: 
      
      ScreenUtilInit(designSize: const Size(414,896), builder: () => 
      
      GetStarted()
      
      )
    );
  }
}
