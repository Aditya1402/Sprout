// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:project_sprout/custom_widgets/sub_header.dart';
import 'package:project_sprout/model_classes/colours.dart';
import 'package:project_sprout/pages/user_input.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import '../model_classes/colours.dart';
import 'user_input.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override

  // Declaring Weather Card Variables
  var temperature;
  var address;
  var location;
  var weather;
  int _pageIndex = 0;

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    address = '${place.subAdministrativeArea},${place.administrativeArea}';
    await address;
    final String apiEndpoint =
        ("https://api.openweathermap.org/data/2.5/weather?q=$address&units=metric&appid=cbf9c071f96e2af72aefe1863047f79d");
    final Uri url = Uri.parse(apiEndpoint);
    final response = await http.post(url);
    var results = await jsonDecode(response.body);
    setState(() {
      address = address;
      this.temperature = results['main']['temp'];
      this.weather = results['weather'][0]['main'];
    });
  }

  Future getData() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  /////////////////////////////////////////////////////////////////////////

  // Greeting Message
  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'Good Morning!';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon!';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening!';
    } else {
      return 'Good Night!';
    }
  }

  // Weather Card Color
  List<Color> changeColor() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return [Color(0xff20BDFF), Color(0xffA5FECB)];
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return [Color(0xffED4264), Color(0xfffeb47b)];
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return [Color(0xff7474BF), Color(0xff348AC7)];
    } else {
      return [Color(0xff4b6cb7), Color(0xff182848)];
    }
  }

  /////////////////////// CODE BEGINS HERE ///////////////////////
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar Configurations
      appBar: AppBar(
        // Removing AppBar Back Button
        automaticallyImplyLeading: false,
        centerTitle: true,

        // Bottom Border
        bottom: PreferredSize(
          child: Container(
            color: Shade.t3,
            height: 3.h,
          ),
          preferredSize: Size.fromHeight(1.5.h),
        ),

        // Color
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          finalName,
          style: const TextStyle(fontWeight: FontWeight.bold, color: Shade.t4),
        ),

        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                IconlyLight.more_circle,
                color: Shade.t1,
                size: 28.w,
              ))
        ],
      ),

      ///////////////////////// BODY /////////////////////////////
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubHead('Hi ${finalName},'),
            Text(
              greetingMessage(),
              style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.w900,
                  color: Shade.t1),
            ),

            // Gap
            SizedBox(
              height: 30.h,
            ),

            // Weather Card
            Card(
              elevation: 0,
              child: Container(
                width: double.infinity,
                height: 170.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: changeColor(),
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(15)),

                ////////////// ACTUAL DATA ////////////////
                child: Padding(
                  padding: EdgeInsets.all(20.w),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            address ?? "-",
                            style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Shade.dew),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            temperature != null ? (temperature.toInt()).toString() + "°C" : '-',
                            style: TextStyle(
                                fontSize: 55.sp,
                                fontWeight: FontWeight.bold,
                                color: Shade.dew),
                          ),
                          Text(
                            weather != null ? weather.toString() : '-',
                            style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Shade.dew),
                          ),
                        ],
                      ),

                      SizedBox(
                        width: 60.w,
                      ),

                      // Weather Image
                      LottieBuilder.asset('images/lotties/panda1.json')
                    ],
                  ),
                ),
              ),
            ),

            // Gap
            SizedBox(
              height: 8.h,
            ),

            // Action Card
            Card(
              elevation: 0,
              child: Container(
                width: double.infinity,
                height: 180.h,
                decoration: BoxDecoration(
                    color: Shade.t3, borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    RaisedButton(onPressed: () {}, child: Text('Search')),
                    RaisedButton(onPressed: () {}, child: Text('Recommend Me'))
                  ],
                ),
              ),
            ),

            // Gap
            SizedBox(
              height: 8.h,
            ),

            Card(
              elevation: 0,
              child: Container(
                width: double.infinity,
                height: 130.h,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xffFFC4FD), Color(0xffBFE5FF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                    borderRadius: BorderRadius.circular(15)),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
