// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/pages/recommend_user.dart';
import 'package:sprout/widgets/common/appBar.dart';

class PlantDetail extends StatefulWidget {
  int cardnum;
  PlantDetail(this.cardnum);
  @override
  _PlantDetailState createState() => _PlantDetailState();
}

class _PlantDetailState extends State<PlantDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDE18D),
      appBar: NewAppBar(dataSet[widget.cardnum][1]),

      body: Column
      (
        children: 
        [
          Image.asset('assets/images/plantIcon/exotics/Azalea.png',width: 250.w,),

          SizedBox(height: 30.h,),

          Expanded(
            child: Stack(
              children:[

                Container(
            
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.45),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(85)
                  )
                ),
            
            
                      
                width: double.maxFinite,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Container(
                  padding: EdgeInsets.fromLTRB(40, 40, 25, 0),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(75)
                    )
                  ),

                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: 
                      [
                        Text(dataSet[widget.cardnum][1],
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Shade.smoke,
                          fontWeight: FontWeight.w800
                        ),),
                  
                        Text(dataSet[widget.cardnum][2],
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Shade.ash
                        ),),
                  
                        SizedBox(
                          height: 30.h,
                        ),
                  
                        Text("Description",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800
                        ),),

                        SizedBox(
                          height: 10.h,
                        ),
                  
                        Text(dataSet[widget.cardnum][10],
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w300
                        ),),

                        SizedBox(
                          height: 18.h,
                        ),
                  
                        Text("Water Requirements",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w800
                        ),),
                      ],
                    ),
                  ),


            
            
                        
                  
                ),
              ),


              ]
            ),
          )
        ],
      ),

    );
  }
}
