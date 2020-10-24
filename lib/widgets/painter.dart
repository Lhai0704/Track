import 'dart:ui';

import 'package:flutter/material.dart';

/**
 * Created by luhai on 2020/9/15
 */

class Painter extends CustomPainter{
  final width = window.physicalSize.width / window.devicePixelRatio;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromPoints(Offset(-30, -100), Offset(width + 30, 200));

    var paint = Paint()
        ..color = Color.fromRGBO(0, 195, 198, 1);

    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}