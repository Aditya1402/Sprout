import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:sprout/pages/reminder.dart';

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
        channelDescription: '',
      ),
    ],
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Reminder(),
    );
  }
}
