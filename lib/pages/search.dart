import 'package:flutter/material.dart';

import '../custom_widgets/app_bar.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(56),child: CustomAppBar("Search")),
      body: Center(child: Text("SEARCH PAGE"),),
    );
  }
}
