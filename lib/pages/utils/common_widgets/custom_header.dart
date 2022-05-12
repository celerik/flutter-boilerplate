import 'package:argonovo/pages/utils/providers/theme_provider.dart';
import 'package:flutter/material.dart';

class CustomHeader extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ThemeProvider().secondaryColor
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.20)
      ..quadraticBezierTo(size.width * 0.25, size.height * 0.24, size.width * 0.50, size.height * 0.2)
      ..quadraticBezierTo(size.width * 0.75, size.height * 0.15, size.width, size.height * 0.2)
      ..lineTo(size.width, 0);

    canvas.drawPath(path, paint);
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
