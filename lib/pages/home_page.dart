import 'package:flutter/material.dart';
import 'package:project_sprout/model_classes/colours.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // App Bar Configurations
      appBar: AppBar(
          // Color
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Aditya1402"),
      ),
    );
  }
}
