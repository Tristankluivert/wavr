
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:wavr/core/model/score.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wavr/features/dashboard/components/weekly_chart.dart';

class ChartPage extends StatefulWidget{


  @override
  _ChartPage createState() => _ChartPage();

}

class _ChartPage extends State<ChartPage>{

  late List<Score> _scores;
  final rng = Random();
  static const dayCount = 7;

  @override
  void initState() {
   final score = List<Score>.generate(dayCount, (index){
     final y = rng.nextDouble() * 30.0;
     final d = DateTime.now().add(Duration(days: -dayCount + index));
     return Score(y, d);
   });

   setState(() {
     _scores = score;
   });
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 150,
        width: 400,
        child: WeeklyChart(_scores));
  }

}