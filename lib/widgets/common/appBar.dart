import 'package:flutter/material.dart';
import 'package:sprout/model_data/colors.dart';

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  ////////// CONSTRUCTORS //////////

  String titleText;

  NewAppBar(this.titleText);

  /////////////////////////////////

  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Text(titleText,
      style: const TextStyle(
        color: Shade.smoke,
      ),),
      
    );
  }
}
