import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wavr/core/model/score.dart';

import 'chart_painter.dart';

class WeeklyChart extends StatefulWidget {

  final List<Score> scores;

  WeeklyChart(this.scores);

  @override
  _WeeklyChartState createState() => _WeeklyChartState();
}

const WeekDays = ["","Mon","Tue","Wed","Thu","Fri","Sat","Sun"];

class _WeeklyChartState extends State<WeeklyChart> {

  late double _min, _max;
  late List<double> _Y;
  late List<String> _X;
  @override
  void initState() {
   super.initState();
   var min = double.maxFinite;
   var max = double.maxFinite;

   widget.scores.forEach((element) {
     min = min > element.value ? element.value : min;
     max = max < element.value ? element.value : max;

   });
   setState(() {
     _min = min;
     _max = max;
     _Y = widget.scores.map((e) => e.value).toList();
     _X = widget.scores.map((e) =>
     "${WeekDays[e.time.weekday]}\n${e.time.day}").toList();
   });
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        child: Container(),
        painter: ChartPainter(_X, _Y, _min, _max),

    );
  }
}