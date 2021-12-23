import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/carousel.dart';
import 'package:sprout/widgets/common/sbutton.dart';

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Column(
          children: 
          [
            const Spacer(),

           // Header 
            FadeIn(
              duration: const Duration(seconds: 4),
              child: Text("Aloe from the other side!👋🏻",
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: Shade.smoke,
              ),),
            ),


            SizedBox(
              height: 20.h,
            ),


            // Button
            FadeIn(
              delay: const Duration(seconds: 4),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SButton(buttonText: "Take A Tour!", 
                pressAction: ()=> Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: CarouselPage())), 
                buttonColor: Shade.smoke),
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
