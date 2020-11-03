import 'package:flutter/material.dart';

class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint =Paint();
    paint.color=Colors.yellow[700];
    paint.style=PaintingStyle.fill;


    var path=Path();
    // path.moveTo(size.width *0.55, 55);
    // path.quadraticBezierTo(size.width *0.55, 130, size.width*0.89 , 120);
    // path.quadraticBezierTo(size.width *0.99 , 110, size.width , 125);
    // path.lineTo(size.width, 0);
    // path.lineTo(size.width*0.8, 0);
    // path.quadraticBezierTo(size.width*0.73 , 0, size.width *0.55, 54);
      path.moveTo(size.width*0.8, 0);
      path.quadraticBezierTo(size.width*0.8, 10, size.width*0.55, 50);
      path.quadraticBezierTo(size.width*0.55, 120, size.width*0.9, 120);

      path.lineTo(size.width,122);
      path.lineTo(size.width, 0);




    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
