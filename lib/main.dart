import 'package:flutter/material.dart';

import 'cube_painter.dart';

void main() => runApp(const CubeApp());

class CubeApp extends StatelessWidget {
  const CubeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CubePage(),
    );
  }
}

class CubePage extends StatefulWidget {
  const CubePage({super.key});

  @override
  State<CubePage> createState() => _CubePageState();
}

class _CubePageState extends State<CubePage> {
  double angleX = 0;
  double angleY = 0;
  double scale = 100.0; // Initial scale value

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      angleY += details.delta.dx * 0.01;
      angleX -= details.delta.dy * 0.01;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('3D Cube Rotator')),
      body: Column(
        children: [
          Expanded(
            child: GestureDetector(
              onPanUpdate: _onPanUpdate,
              child: Center(
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: CubePainter(angleX, angleY, scale),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Slider(
              value: scale,
              min: 50,
              max: 200,
              onChanged: (double value) {
                setState(() {
                  scale = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}


//colors in the cube

// import 'dart:math';
// import 'package:flutter/material.dart';
//
// void main() => runApp(const CubeApp());
//
// class CubeApp extends StatelessWidget {
//   const CubeApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: CubePage(),
//     );
//   }
// }
//
// class CubePage extends StatefulWidget {
//   const CubePage({super.key});
//
//   @override
//   State<CubePage> createState() => _CubePageState();
// }
//
// class _CubePageState extends State<CubePage> {
//   double angleX = 0;
//   double angleY = 0;
//   double scale = 100.0; // Initial scale value
//
//   void _onPanUpdate(DragUpdateDetails details) {
//     setState(() {
//       angleY += details.delta.dx * 0.01;
//       angleX -= details.delta.dy * 0.01;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('3D Colored Cube Rotator')),
//       body: Column(
//         children: [
//           Expanded(
//             child: GestureDetector(
//               onPanUpdate: _onPanUpdate,
//               child: Center(
//                 child: CustomPaint(
//                   size: const Size(300, 300),
//                   painter: CubePainter(angleX, angleY, scale),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Slider(
//               value: scale,
//               min: 50,
//               max: 200,
//               onChanged: (double value) {
//                 setState(() {
//                   scale = value;
//                 });
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CubePainter extends CustomPainter {
//   final double angleX;
//   final double angleY;
//   final double scale;
//
//   CubePainter(this.angleX, this.angleY, this.scale);
//
//   final List<List<double>> vertices = [
//     [-1, -1, -1], [1, -1, -1], [1, 1, -1], [-1, 1, -1],
//     [-1, -1, 1], [1, -1, 1], [1, 1, 1], [-1, 1, 1]
//   ];
//
//   final List<List<int>> faces = [
//     [0, 1, 2, 3], // Front
//     [4, 5, 6, 7], // Back
//     [0, 1, 5, 4], // Bottom
//     [2, 3, 7, 6], // Top
//     [0, 3, 7, 4], // Left
//     [1, 2, 6, 5], // Right
//   ];
//
//   final List<Color> faceColors = [
//     Colors.red,    // Front
//     Colors.green,  // Back
//     Colors.blue,   // Bottom
//     Colors.orange, // Top
//     Colors.purple, // Left
//     Colors.yellow, // Right
//   ];
//
//   List<double> rotateX(List<double> point, double angle) {
//     double y = point[1] * cos(angle) - point[2] * sin(angle);
//     double z = point[1] * sin(angle) + point[2] * cos(angle);
//     return [point[0], y, z];
//   }
//
//   List<double> rotateY(List<double> point, double angle) {
//     double x = point[0] * cos(angle) + point[2] * sin(angle);
//     double z = -point[0] * sin(angle) + point[2] * cos(angle);
//     return [x, point[1], z];
//   }
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..strokeWidth = 2;
//     final centerX = size.width / 2;
//     final centerY = size.height / 2;
//
//     List<Offset> projected = vertices.map((vertex) {
//       var rotated = rotateX(vertex, angleX);
//       rotated = rotateY(rotated, angleY);
//
//       double x = rotated[0] * scale + centerX;
//       double y = rotated[1] * scale + centerY;
//
//       return Offset(x, y);
//     }).toList();
//
//     for (int i = 0; i < faces.length; i++) {
//       final path = Path()
//         ..moveTo(projected[faces[i][0]].dx, projected[faces[i][0]].dy)
//         ..lineTo(projected[faces[i][1]].dx, projected[faces[i][1]].dy)
//         ..lineTo(projected[faces[i][2]].dx, projected[faces[i][2]].dy)
//         ..lineTo(projected[faces[i][3]].dx, projected[faces[i][3]].dy)
//         ..close();
//
//       paint.color = faceColors[i].withOpacity(0.9);
//       paint.style = PaintingStyle.fill;
//       canvas.drawPath(path, paint);
//
//       paint.color = Colors.black;
//       paint.style = PaintingStyle.stroke;
//       canvas.drawPath(path, paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }


