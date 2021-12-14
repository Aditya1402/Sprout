import 'package:flutter/material.dart';

import '../custom_widgets/app_bar.dart';

class Profile extends StatelessWidget {
  const Profile ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(56),child: CustomAppBar("Profile")),
      body: Center(child: Text("PROFILE PAGE"),),
    );
  }
}