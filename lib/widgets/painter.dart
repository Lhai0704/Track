import 'package:flutter/material.dart';

/**
 * Created by luhai on 2020/9/15
 */

class Painter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(-30, -200), Offset(450, 180));

    var paint = Paint()
        ..color = Color.fromRGBO(0, 195, 198, 1);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}