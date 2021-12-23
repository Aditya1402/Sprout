import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sprout/model_data/colors.dart';

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
////////////////////////////////////////////////////////////////////////////////

  // Constructor Variables
  String? text;
  bool? iconNeed = false;
  IconData? cIcon;

  // Constructor
  NewAppBar(this.text, this.iconNeed,[this.cIcon]);

////////////////////////////////////////////////////////////////////////////////

  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        text!,
        style: TextStyle(
            fontSize: 16.sp, fontWeight: FontWeight.w900, color: Shade.smoke),
      ),
      centerTitle: true,
      actions: [
        if (iconNeed == true)

          PopupMenuButton<String>(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            icon: FaIcon(FontAwesomeIcons.ellipsisH,color: Shade.smoke,size: 20.w,),
            onSelected: null,
            itemBuilder: (BuildContext context) {
              return {'Logout', 'Settings'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice,style: TextStyle(
                    fontSize: 15.sp,
                  ),),
                );
              }).toList();
            },
          ),
      ],
    );
  }
}
