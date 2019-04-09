import 'package:flutter/material.dart';

class CustomPathPainter extends CustomPainter {
  final double blurRadius;
  final Color color;

  CustomPathPainter({@required this.blurRadius, @required this.color});
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    var secondEndPoint = Offset(size.width, size.height - 90);
    var secondControlPoint = Offset(size.width * .75, size.height);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawShadow(path, color, blurRadius, false);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
