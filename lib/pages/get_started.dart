import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sprout/firebase/signIn.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/sbutton.dart';
import 'package:connectivity/connectivity.dart';

class GetStarted extends StatefulWidget {
  @override
  State<GetStarted> createState() => _GetStartedState();
}
isConnectedToInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) return false;
  return true;
}
class _GetStartedState extends State<GetStarted> {
  @override
   initState() {
    super.initState();
    NetworkCheck();
  }
  NetworkCheck() async {
    if (!await isConnectedToInternet()) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('No internet connection'))));
    } else {}}
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(25.w),
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
              duration: const Duration(seconds: 1),
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
              delay: const Duration(seconds: 1),
              child: SButton(
                buttonText: "Sign In",
                pressAction: () => Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: const SignIn())),
                buttonColor: Shade.moss,)),

            SizedBox(height: 8.h),


            FadeInUp(
              delay: const Duration(seconds: 1),
              child: SButton(
                buttonText: "Create Account",
                pressAction: (){},
                buttonColor: Shade.smoke,
                textColor: Colors.white,))






          ],
        ),
      ),
    );
  }
}


