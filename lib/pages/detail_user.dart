// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:sprout/widgets/common/appBar.dart';
import 'package:sprout/widgets/home_page/weatherCard.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  ///////////////////////////////////////////

  List<List<dynamic>> dataSet = [];

  void _loadCSV() async {
    final _rawData =
        await rootBundle.loadString("lib/Dataset/sprout.csv");
    List<List<dynamic>> listData = const CsvToListConverter().convert(_rawData);
    setState(() {
      dataSet = listData;
    });
  }
  


  ///////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewAppBar('Recommendations'),
      body: ListView.builder(
        itemCount: dataSet.length,
        itemBuilder: (_, index) {
          if(dataSet[index][2].toString()=="Flower")
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                
                color: index == 0 ? Colors.amber : Colors.white,
                child: ListTile(
                  leading: Text(dataSet[index][10].toString()),
                  // title: Text(dataSet[index][1].toString()),
                  // trailing: Text(dataSet[index][2].toString()),
                ),
              ),
            );
          return SizedBox(); 
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: _loadCSV),
    );
  }
}
