import 'dart:math';
import 'package:flutter/material.dart';

class CubePainter extends CustomPainter {
  final double angleX;
  final double angleY;
  final double scale;


  CubePainter(this.angleX, this.angleY, this.scale);

  final List<List<double>> vertices = [
    [-1, -1, -1], [1, -1, -1], [1, 1, -1], [-1, 1, -1],
    [-1, -1, 1], [1, -1, 1], [1, 1, 1], [-1, 1, 1]
  ];

  final List<List<int>> edges = [
    [0, 1], [1, 2], [2, 3], [3, 0],
    [4, 5], [5, 6], [6, 7], [7, 4],
    [0, 4], [1, 5], [2, 6], [3, 7]
  ];

  List<double> rotateX(List<double> point, double angle) {
    double y = point[1] * cos(angle) - point[2] * sin(angle);
    double z = point[1] * sin(angle) + point[2] * cos(angle);
    return [point[0], y, z];
  }

  List<double> rotateY(List<double> point, double angle) {
    double x = point[0] * cos(angle) + point[2] * sin(angle);
    double z = -point[0] * sin(angle) + point[2] * cos(angle);
    return [x, point[1], z];
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.deepPurple.shade200
      ..strokeWidth = 2;

    final centerX = size.width / 2;
    final centerY = size.height / 2;

    List<Offset> projected = vertices.map((vertex) {
      var rotated = rotateX(vertex, angleX);
      rotated = rotateY(rotated, angleY);

      double x = rotated[0] * scale + centerX;
      double y = rotated[1] * scale + centerY;

      return Offset(x, y);
    }).toList();

    for (var edge in edges) {
      canvas.drawLine(projected[edge[0]], projected[edge[1]], paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}