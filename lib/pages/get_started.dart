import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/sbutton.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: 
          [

            SizedBox(height: 40.h,),

            Center(
              child: Text("sprout.",
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: Shade.ash
              ),),
            ),

            


            SizedBox(height: 100.h),



            FadeIn(
              delay: Duration(seconds: 1),
              child: Center(
                child: Container(
                  height: 200.h,
                  child: OverflowBox(
                    minHeight: 300.h,
                    maxHeight: 300.h,
                    child: LottieBuilder.asset("assets/images/lottie/spinning_carrot.json"))),
              ),
            ),

            SizedBox(height: 60.h),

            Text("Welcome to Sprout",
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w800,
              color: Shade.smoke
            )),

            SizedBox(height: 35.h),

            
            Text("Gardening is cheaper than therapy",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Shade.smoke
            )),

            SizedBox(height: 8.h),

            Text("Also you get the Carrots!",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Shade.ash)),

            SizedBox(height: 45.h),

            FadeInUp(
              delay: Duration(seconds: 1),
              child: SButton(buttonText: "Sign In", pressAction: (){}, buttonColor: Shade.moss,)),

            SizedBox(height: 8.h),


            FadeInUp(
              delay: Duration(seconds: 1),
              child: SButton(buttonText: "Create Account", pressAction: (){}, buttonColor: Shade.smoke,textColor: Colors.white,))






          ],
        ),
      ),
    );
  }
}
