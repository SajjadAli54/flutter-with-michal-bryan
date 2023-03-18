# Widget Graphics Manipulation

## Opacity

```dart
import 'package:flutter/material.dart';

class MyOpacity extends StatefulWidget {
  const MyOpacity({super.key});

  @override
  State<MyOpacity> createState() => _MyOpacityState();
}

class _MyOpacityState extends State<MyOpacity> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Opacity'),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedOpacity(
                opacity: _visible ? 1.0 : 0.2,
                duration: const Duration(milliseconds: 500),
                child: InteractiveViewer(
                    child: Image.network(
                        'https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8&w=1000&q=80'))),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _visible = !_visible;
                });
              },
              child: const Text("Toggle Opacity"),
            ),
          ],
        ),
      ),
    );
  }
}
```

## Rotated Box

```dart
import 'package:flutter/material.dart';

class MyRotatedBox extends StatefulWidget {
  const MyRotatedBox({super.key});

  @override
  State<MyRotatedBox> createState() => _MyRotatedBoxState();
}

class _MyRotatedBoxState extends State<MyRotatedBox> {
  int turns = 0;
  double values = 0;

  void onChange(double value) {
    setState(() {
      values = value;
      turns = value.toInt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Slider(
            value: values,
            min: 0,
            max: 4,
            divisions: 4,
            onChanged: onChange,
          ),
          RotatedBox(
            quarterTurns: turns,
            child: const Text('Hello World'),
          ),
        ],
      ),
    );
  }
}
```

## Box Decoration

```dart
import 'package:flutter/material.dart';

class MyBoxDecoration extends StatefulWidget {
  const MyBoxDecoration({super.key});

  @override
  State<MyBoxDecoration> createState() => _MyBoxDecorationState();
}

class _MyBoxDecorationState extends State<MyBoxDecoration> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("BoxDecoration"),
          Container(
            padding: const EdgeInsets.all(32.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.orange,
                width: 2.0,
              ),
              gradient: const LinearGradient(
                colors: [Colors.red, Colors.yellow],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: InteractiveViewer(
                child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
          ),
        ],
      ),
    );
  }
}
```

## Transformation

```dart
import 'package:flutter/material.dart';

class MyTransformation extends StatefulWidget {
  const MyTransformation({super.key});

  @override
  State<MyTransformation> createState() => _MyTransformationState();
}

class _MyTransformationState extends State<MyTransformation> {
  late double x, y, z;

  @override
  void initState() {
    super.initState();
    x = 0.0;
    y = 0.0;
    z = 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("X:"),
              Slider(
                value: x,
                onChanged: (double value) {
                  setState(() {
                    x = value;
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Y:"),
              Slider(
                  value: y,
                  onChanged: (double value) {
                    setState(() {
                      y = value;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Z:"),
              Slider(
                value: z,
                onChanged: (double value) {
                  setState(() {
                    z = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Transform(
            transform: Matrix4.skewY(y),
            child: Transform(
              transform: Matrix4.skewX(x),
              child: Transform(
                transform: Matrix4.rotationZ(z),
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: 200,
                  child: InteractiveViewer(
                      child: Image.network(
                          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg')),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
```

## Custom Painter

```dart
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
```
