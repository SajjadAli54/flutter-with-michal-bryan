import 'package:flutter/material.dart';

class MyPaintDemo extends StatefulWidget {
  const MyPaintDemo({super.key});

  @override
  State<MyPaintDemo> createState() => _MyPaintDemoState();
}

class _MyPaintDemoState extends State<MyPaintDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Custom Paints",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        const SizedBox(height: 20),
        CustomPaint(
            painter: Painter(),
            child: Container(
              width: 200,
              height: 200,
            )),
      ],
    )));
  }
}

class Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final radius = 100.0;
    final offset = Offset(0.0, 75.0);
    final bodyOffset = Offset(0.0, 50.0);
    final bodySize = Size(0.0, 0.0);

    final paint = Paint()
      ..isAntiAlias = true
      ..strokeWidth = 10.0
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0;

    canvas.drawCircle(offset, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
