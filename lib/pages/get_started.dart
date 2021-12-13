import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:project_sprout/custom_widgets/body_text.dart';
import 'package:project_sprout/custom_widgets/header.dart';
import 'package:project_sprout/custom_widgets/sub_header.dart';
import 'package:project_sprout/model_classes/colours.dart';
import 'package:project_sprout/pages/user_input.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //////////////////// STARTS HERE ////////////////////
    return Scaffold(
      backgroundColor: Color(0xffEDEDED),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.center,

          children: 
          [ 
            
            // Gap
            SizedBox(
              height: 191.h,
            ),
        
            // Lottie
            Center(child: LottieBuilder.asset('images/lotties/panda1.json',width: 140.w,)),
        
            // Gap
            SizedBox(
              height: 25.h,
            ),
        
            // Text 1
            Head("Gardening is cheaper than therapy*",TextAlign.center),
        
            // Gap
            SizedBox(
              height: 8.h,
            ),
        
            // Text 2
            SubHead('Also you get the tomatoes!',TextAlign.center),
        
            // Gap
            SizedBox(
              height: 45.h,
            ),
        
            // Text 2
            BodyText('Get recommendations & delve into the plantverse to find \'the\' right plant for you. This is your brand-new gardening companion!',TextAlign.center),
        
            // Gap
            SizedBox(
              height: 190.h,
            ),
        
            // Button
            AnimatedButton(
              color: Shade.orca,
              width: 354.w, 
              height: 60,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Input()));
              }, 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
            
                  // Button Text
                  Text("GET STARTED",
                    style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w900),
                    textScaleFactor: 1.1,),

                  // Gap
                  SizedBox(
                    width: 100.w,
                  ),

                  // Button icon
                  Icon(IconlyBold.arrow_right_2,color: Shade.dew,size: 28.sp)
                ],
              )),

            Spacer()
          ],
        ),
      ),
    );
  }
}
