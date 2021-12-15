import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconly/iconly.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Column(
        
          crossAxisAlignment: CrossAxisAlignment.start,

          children: 
          [ 
            
            // Gap
            SizedBox(
              height: 90.h,
            ),

            
            // Branding Text
            const Center(child: Text('sprout.',style: TextStyle(fontWeight: FontWeight.w900),)),

            // Gap
            SizedBox(
              height: 50.h,
            ),
        
            // Image
            Center(child: SvgPicture.asset('./images/svg/get_started.svg',width: 140.w,)),
        
            // Gap
            SizedBox(
              height: 35.h,
            ),
        
            // Header 1
            Head("Gardening is cheaper than therapy*",TextAlign.start),
        
            // Gap
            SizedBox(
              height: 8.h,
            ),
        
            // Header 2
            SubHead('Also you get the tomatoes!',TextAlign.center),
        
            // Gap
            SizedBox(
              height: 45.h,
            ),
        
            // Body Text
            BodyText('Get recommendations & delve into the plantverse to find \'the\' right plant for you. This is your brand-new gardening companion!',TextAlign.start),
        
            // Gap
            SizedBox(
              height: 170.h,
            ),
        
            // Button
            Center(
              child: FlatButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Shade.orca,
                minWidth: 354.w, 
                height: 60,
                onPressed: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Input()));
                }, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
              
                    // Button Text
                    Text("CREATE AN ACCOUNT",
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
            ),

            Center(
              child: TextButton(
                onPressed: (){}, 
              child: Text("SIGN IN",
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w900,
                color: Shade.orca
              ),)),
            ),

            const Spacer()
          ],
        ),
      ),
    );
  }
}
