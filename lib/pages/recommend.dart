import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sprout/widgets/api_service/function.dart';

class Recommend extends StatefulWidget {
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override

  ////////// API VARIABLES //////////

  // API url
  String url = '';

  // API returned Data
  var data;
  String finalVal = "Initial Output";

  ///////////////////////////////////

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Spacer(),
            TextField(
              onChanged: (value) {
                url = 'http://10.0.2.2:5000/?temperature=' + value.toString();
              },
            ),
            TextButton(
                onPressed: () async {
                  data = await jsonDecode(fetchData(url));
                  setState(() {
                    finalVal = data['output'];
                  });
                },
                child: Text("Fetch ASCII Value")),
            Text(finalVal),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
