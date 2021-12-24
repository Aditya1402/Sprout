import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/appBar.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  //////////////////////////////////////

  final controller = TextEditingController();

  /////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('Search'),
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          children: [
            TextField(
              cursorWidth: 2.5,
              cursorHeight: 24,
              cursorColor: Shade.smoke,
              decoration: InputDecoration(
                  hintText: 'Search for your plants here!👋🏻',
                  hintStyle: TextStyle(
                      color: Shade.ash,
                      fontWeight: FontWeight.w500,
                      fontSize: 18.sp),
                  border: InputBorder.none),
              style: TextStyle(
                  color: Shade.smoke,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w800),
                  controller: controller,
                  textCapitalization: TextCapitalization.words,
                  
            )
          ],
        ),
      ),
    );
  }
}
