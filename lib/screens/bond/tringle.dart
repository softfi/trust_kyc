import 'package:flutter/material.dart';

class Triangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final x = size.width;
    final y = size.height;

    path.moveTo(0, y / 2);
    path.lineTo(15, y);
    path.lineTo(x, y);
    path.lineTo(x, 0);
    path.lineTo(15, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}