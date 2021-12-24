// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:animate_do/animate_do.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sprout/model_data/colors.dart';
import 'package:sprout/widgets/common/appBar.dart';
import 'package:sprout/widgets/home_page/weatherCard.dart';

class Recommended extends StatefulWidget {
  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  ///////////////////////////////////////////

  List<List<dynamic>> dataSet = [];

  void _loadCSV() async {
    final _rawData = await rootBundle.loadString("lib/Dataset/plantBase.csv");
    List<List<dynamic>> listData =
        const CsvToListConverter(shouldParseNumbers: true).convert(_rawData);
    setState(() {
      dataSet = listData;
    });
  }

  //////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Shade.moss,
        appBar: NewAppBar("dataSet[index][1]"),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(25.w),
            child: ListView.builder(
              itemCount: dataSet.length,
              itemBuilder: (_, index) {

                if (dataSet[index][4] <= sendTemp && sendTemp <= dataSet[index][5])
                  return GestureDetector(

                    onTap: ()=> ,

                    child: FadeInUp(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                          color: index == 0 ? Colors.amber : Colors.white,
                          child: ListTile(
                            leading: Image.asset('assets/images/plantIcon/fruits/Cherry.png',width: 45.w,),
                            title: Text(dataSet[index][1].toString()),
                            // trailing: Text(dataSet[index][2].toString()),
                          ),
                        ),
                      ),
                    ),
                  );
                return SizedBox();
              },
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _loadCSV(),
        ));
  }
}
