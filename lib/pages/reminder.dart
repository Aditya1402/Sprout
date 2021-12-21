import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:sprout/main.dart';
//import 'package:sprout/pages/home_page.dart';
import 'package:sprout/reminder/utilities.dart';
import 'package:sprout/reminder/notification_service.dart';

class Reminder extends StatefulWidget {
  @override
  _ReminderState createState() => _ReminderState();
}

class _ReminderState extends State<Reminder> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Allow Notifications'),
            content: const Text('Our app would like to send you notifications'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Don\'t Allow',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
              ),
              TextButton(
                  onPressed: () => AwesomeNotifications()
                      .requestPermissionToSendNotifications()
                      .then((_) => Navigator.pop(context)),
                  child: const Text(
                    'Allow',
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ))
            ],
          ),
        );
      }
    });

    AwesomeNotifications().createdStream.listen((notification) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Your reminder has been scheduled.',
        ),
      ));
    });

    AwesomeNotifications().actionStream.listen((notification) {
      if (notification.channelKey == 'basic_channel' && Platform.isIOS) {
        AwesomeNotifications().getGlobalBadgeCounter().then(
              (value) =>
                  AwesomeNotifications().setGlobalBadgeCounter(value - 1),
            );
      }

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => Reminder(),
        ),
        (route) => route.isFirst,
      );
    });
  }

  @override
  void dispose() {
    AwesomeNotifications().actionSink.close();
    AwesomeNotifications().createdSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(
                    'Set a reminder to water your plants.',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  child: Text(
                    'You can choose any time, but we suggest early morning.',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 300,
                ),
                Container(
                  height: 60,
                  width: 200,
                  child: TextButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor:
                          MaterialStateProperty.all(const Color(0xffB2B9F7)),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                    ),
                    onPressed: () async {
                      NotificationWeekAndTime? pickedSchedule =
                          await pickSchedule(context);

                      if (pickedSchedule != null) {
                        createWaterReminderNotification(pickedSchedule);
                      }
                    },
                    child: const Text(
                      'Add a reminder',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
