import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sprout/pages/firstPage.dart';
import 'package:sprout/pages/get_started.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> 
{
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FirstPage())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          color: Color(0xffE2E2E2),
        ),
      ),
    );
  }
}


