// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:project_sprout/custom_widgets/nav_bar.dart';
import 'package:project_sprout/custom_widgets/sub_header.dart';
import 'package:project_sprout/model_classes/colours.dart';
import 'package:project_sprout/pages/home_page.dart';

   late String finalName  ;
   late double finalArea;

class Input extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  ////////////////////// SUPPORT DATA //////////////////////

  final _formKey = GlobalKey<FormState>();

  // Controller Fields
  int index = 0;
  final name = TextEditingController();
  final area = TextEditingController();


  // Question List
  List<String> questions = [
    'Enter your First Name in the field below*',
    'Enter your approximate planting area (in sq.m)*'
  ];

  // Change Question
  void updateIndex() {
    setState(() {
      if (!_formKey.currentState!.validate()) {
        return;
      } else {
        index == 0
            ? finalName = name.text
            : finalArea = double.parse(area.text);
        index++;
      }
    });
  }

  ////////////////////// CODE BEGINS HERE //////////////////////
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Spacer(),

              // Text
              SubHead(questions[index]),

              SizedBox(
                height: 10.h,
              ),

              // TextField
              TextFormField(
                validator: (value) {
                  if (value!.isNotEmpty) {
                    return null;
                  } else {
                    return index == 0
                        ? "Please enter your name."
                        : "Please enter a value.";
                  }
                },

                style: TextStyle(color: Shade.t2, fontWeight: FontWeight.bold),
                cursorColor: Shade.t2,
                keyboardType:
                    index == 0 ? TextInputType.name : TextInputType.number,
                decoration: InputDecoration(
                  // Error Styling
                  errorStyle: TextStyle(
                      color: Shade.vermillion,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),

                  // Error Border
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.5, color: Shade.hail),
                      borderRadius: BorderRadius.circular(12)),

                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.5, color: Shade.hail),
                      borderRadius: BorderRadius.circular(12)),

                  // Field State
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.5, color: Shade.hail),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.5, color: Shade.hail),
                      borderRadius: BorderRadius.circular(12)),

                  // Filling Color
                  fillColor: Shade.snow,
                  filled: true,

                  // Hint Text Label
                  hintText: index == 0 ? 'eg: Aditya' : 'eg: 250',
                  hintStyle:
                      TextStyle(fontWeight: FontWeight.w700, color: Shade.t4),
                ),

                // Storing the UserInput in Variables
                controller: index == 0 ? name : area,
              ),

              SizedBox(
                height: 30.h,
              ),

              TextButton(
                style: TextButton.styleFrom(splashFactory: NoSplash.splashFactory),
                  onPressed: index==0
                  ?updateIndex
                  :() => Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar())),
                  child: Text(
                    "NEXT",
                  
                    style: TextStyle(
                        fontSize: 18.5.sp,
                        fontWeight: FontWeight.w900,
                        color: Shade.straw),
                  )),

              Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
