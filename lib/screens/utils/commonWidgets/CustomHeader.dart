import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/screens/utils/providers/ThemeProvider.dart';

class HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();
    paint.color = ThemeProvider().secondaryColor;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;

    final path = new Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.20);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.24,
        size.width * 0.50, size.height * 0.2);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.15, size.width, size.height * 0.2);

    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
