import 'package:flutter/material.dart';

import '../custom_widgets/app_bar.dart';

class Favorite extends StatelessWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(56),child: CustomAppBar("Favorites")),
      body: Center(child: Text("Favorites PAGE"),),
    );
  }
}