// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:boxseller/model/calculateMat.dart';

class MyRectanglePainter extends CustomPainter {
  CalculateMat calculateMat;

  MyRectanglePainter({
    required this.calculateMat,
  });

  @override
  void paint(Canvas canvas, Size size) {
    bool trigerColor = true;

    Paint paint = Paint()
      ..color = Color.fromARGB(255, 63, 39, 5)
      ..style = PaintingStyle.fill;

    Paint paint2 = Paint()
      ..color = Color.fromARGB(255, 145, 144, 127)
      ..style = PaintingStyle.fill;

    Paint paint3 = Paint()
      ..color = Color.fromARGB(255, 94, 85, 79)
      ..style = PaintingStyle.fill;

    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, paint);

    double rectWidth = calculateMat.bestestTemplate['start_width'] * 0.1;
    double rectHeight = calculateMat.bestestTemplate['start_height'] * 0.1;

    double primaryRow = calculateMat.bestestTemplate['primaryRow'];
    double primaryPerRow = calculateMat.bestestTemplate['primaryPerRow'];
    double rotateRow = calculateMat.bestestTemplate['rotateRow'];
    double rotatePerRow = calculateMat.bestestTemplate['rotatePerRow'];

    for (int row = 0; row < primaryRow; row++) {
      for (int col = 0; col < primaryPerRow; col++) {
        double x = col * rectWidth;
        double y = row * rectHeight;
        Rect rect = Rect.fromLTWH(x, y, rectWidth, rectHeight);
        if (trigerColor) {
          canvas.drawRect(rect, paint2);
        } else {
          canvas.drawRect(rect, paint3);
        }
        trigerColor = !trigerColor;
      }
    }

    // for (int row = primaryRow.toInt(); row < (rotateRow+primaryRow.toInt()) ; row++) {
    //   for (int col = 0; col < rotatePerRow; col++) {
    //     double x = col * rectWidth;
    //     double y = row * rectHeight;
    //     Rect rect = Rect.fromLTWH(x, y, rectHeight, rectWidth);
    //     if (trigerColor) {
    //       canvas.drawRect(rect, paint2);
    //     } else {
    //       canvas.drawRect(rect, paint3);
    //     }
    //     trigerColor = !trigerColor;
    //   }
    // }



    for (int row = 0; row < rotateRow ; row++) {
      for (int col = 0; col < rotatePerRow; col++) {
        double x = col * rectHeight;
        double y = (row * rectWidth) + (rectHeight*primaryRow) ;
        Rect rect = Rect.fromLTWH(x, y, rectHeight, rectWidth);
        if (trigerColor) {
          canvas.drawRect(rect, paint2);
        } else {
          canvas.drawRect(rect, paint3);
        }
        trigerColor = !trigerColor;
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
