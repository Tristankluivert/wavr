
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wavr/config/pallate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ChartPainter extends CustomPainter {

  final List<double> y;
  final List<String> x;
  final double min,max;

  ChartPainter(this.x, this.y, this.min, this.max);

   static const double border = 10.0;
   static const double radius = 5.0;
   final yLabelStyle = GoogleFonts.poppins(
     color: wChartTextColor,
     fontSize: 11.sp
   );
   final xLabelStyle  = GoogleFonts.poppins(
       color: wChartTextColor,
       fontSize: 11.sp
   );

   final linePaint = Paint()
     ..strokeWidth = 1.0
     ..style = PaintingStyle.stroke
    ..color = Colors.white;



  @override
  void paint(Canvas canvas, Size size) {
    final dotFillPoint = Paint()
      ..strokeWidth = 1.0
      ..style = PaintingStyle.fill
      ..color = wPrimaryColorDark;

   final clipRect = Rect.fromLTWH(0, 0, size.width, size.height);
   canvas.clipRect(clipRect);
   canvas.drawPaint(Paint()..color = wPrimaryColorDark);
   //compute the drawable chart width and height
   final drawableHeight = size.height - 2.0 * border;
   final drawableWidth = size.width - 2.0 * border;
   final hd = drawableWidth / 5.0;
   final wd = drawableWidth / this.x.length.toDouble();

    final height = hd * 3.0;
   final width = drawableWidth;
   //escape if values are invalid
    if(height <= 0.0 || width <= 0.0)return;
    if(max - min < 1.0e-6) return;

    final hr = height / (max - min); //height per unit value
    final left = border;
    final top = border;
    final c = Offset(left + wd / 2.0, top + height / 2.0);
    //_drawLine(canvas, c, wd, height);

    final points = _computePoints(c,wd,height,hr);
    final path = _computePath(points);
    final labels = _computeLabels();
    //draw data points and labels
    canvas.drawPath(path, linePaint);
    _drawDataPoints(points, canvas, dotFillPoint);
    _drawYLabels(canvas,labels,points,wd,top);
    //draw xlabels
    final c1 = Offset(c.dx, top + 4.5 * hd);
    _drawXLabels(canvas,c1,wd);


  }

  void _drawDataPoints(List<Offset> points, Canvas canvas, Paint dotFillPoint) {
   points.forEach((dp) {
     canvas.drawCircle(dp, radius, dotFillPoint);
     canvas.drawCircle(dp, radius, linePaint);
   });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  final Paint outlinePaint = Paint()
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke
    ..color = Colors.white;

  void _drawLine(Canvas canvas, Offset c, double wd, double height) {
        y.forEach((element) {
          final rect = Rect.fromCenter(center: c, width: wd, height: height);
          canvas.drawRect(rect,outlinePaint);
          c += Offset(wd,0);
        });
  }

 List<Offset> _computePoints(Offset c, double wd, double height, double hr) {
        List<Offset> points = [];
        y.forEach((yp) {
          final yy =  (yp - min) * hr;
          final dp = Offset(c.dx, c.dy - height / 2.0 + yy);
          points.add(dp);
          c += Offset(wd,0);
        });
        return points;
  }

 Path _computePath(List<Offset> points) {
    final path = Path();
    for(var i = 0; i < points.length; i++){
      final p = points[i];
      if(i == 0){
        path.moveTo(p.dx, p.dy);
      }else{
        path.lineTo(p.dx, p.dy);
      }
    }
    return path;
  }

 List<String> _computeLabels() {
    return y.map((e) => "${e.toStringAsFixed(1)}").toList();
 }

 TextPainter measureText(String s, TextStyle style, double maxWidth, TextAlign align){
    final span = TextSpan(text: s,style: style);
    final tp =  TextPainter(text: span,
    textAlign: align,textDirection: TextDirection.ltr);
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp;
 }

  Size drawTextCentered(Canvas canvas, Offset c, String label,
      TextStyle labelStyle, double wd) {

    final tp = measureText(label,labelStyle,wd, TextAlign.center);
    final offset = c + Offset(-tp.width / 2.0 , -tp.height / 2.0);
    tp.paint(canvas, offset);
    return tp.size;

  }

  void _drawYLabels(Canvas canvas, List<String> labels,List<Offset> points, double wd,
      double top
      ) {
    var i = 0;
    labels.forEach((element) {
      final dp = points[i];
      final dy = (dp.dy - 15.0) < top ? 15.0 : -15.0;
      final ly = dp + Offset(0, dy);
      drawTextCentered(canvas, dp, element, yLabelStyle, wd);
      i++;
    });
  }

  void _drawXLabels(Canvas canvas,Offset c, double wd) {
    x.forEach((element) {
      drawTextCentered(canvas, c, element, xLabelStyle, wd);
      c += Offset(wd,0);
    });
  }


}